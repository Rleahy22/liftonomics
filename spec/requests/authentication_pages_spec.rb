require 'spec_helper'

describe "AuthenticationPages" do
  
  subject { page }

  describe "sign in page" do
    before { visit root_path }

    it { should have_content("Username") }
    it { should have_link('Login') }
  end

  describe "sign in" do
    before { visit root_path }

    describe "with invalid information" do
      before { click_button "Login" }

      it { should have_content("Username") }
      it { should have_content('Invalid') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_link('Sign Out')}
      it { should have_selector('h1', text: user.username) }
      it { should have_link('Account') }
    
      describe "followed by signout" do
        before { click_link "Sign Out" }
        it { should have_content("Username") }
        it { should have_link("Login") }
      end
    end
  end

  describe "authorization" do
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Username:",    with: user.username
          fill_in "Password:", with: user.password
          click_button "Login"
        end

        describe "after signing in" do
          it "should render the desired protected page" do
            expect(page).to have_content(user.username)
          end
        end
      end

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should_not have_content("Save Changes") }
        end
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@user.com", 
                                                   username: "Wronguser") }
      before { sign_in user }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_content('Save Changes') }
      end
    end
  end
end
