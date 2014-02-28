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
  end
end