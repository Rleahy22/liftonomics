require 'spec_helper'

describe "User pages" do
  
  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  describe "signup page" do
    before { visit root_path }

    it { should have_content('Username') }
  end

  describe "signup" do
    before { visit root_path }

    describe "with invalid info" do
      it "should not create a user" do
        expect { click_on "Sign Up" }.not_to change(User, :count)
      end
    end

    describe "with valid info" do
      before do
        fill_in "Username",             with: "Example"
        fill_in "Email",                with: "example@me.com"
        fill_in "Password",             with: "password"
        fill_in "Confirm Password",     with: "password"
        fill_in "Height (Feet)",        with: 6
        fill_in "Height (Inches)",      with: 4
        fill_in "Weight",               with: 200    
      end

      it "should create a user" do
        expect { click_on "Sign Up" }.to change(User, :count).by(1)
      end
    end
  end

  describe "profile page" do
    before { visit user_path(user) }

    it { should have_content(user.username) }
    it { should have_title(user.username) }
    it { should have_content(user.height_feet) }
    it { should have_content(user.height_inches) }
    it { should have_content(user.weight) }

    describe "as different user" do
      let(:other_user) { FactoryGirl.create(:user, username: "otheruser",
                                            email: "other@me.com") }

      before do
        sign_in user
        visit user_path(other_user)
      end

      it { should_not have_content("user.username") }
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content(user.username) }
      it { should have_button("Save Changes") }
    end

    describe "with valid information" do
      let(:new_username) { "NewUserName" }
      let(:new_email) { "new@email.com" }
      before do
        fill_in "Username", with: new_username
        fill_in "Email", with: new_email
        fill_in "Password", with: user.password
        fill_in "Confirm Password", with: user.password
        fill_in "Weight", with: 200
        click_button "Save Changes"
      end

      specify { expect(user.reload.username).to eq new_username }
      specify { expect(user.reload.email).to eq new_email }
      it { should have_content("200") }
    end
  end
end