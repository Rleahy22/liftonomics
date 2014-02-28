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
end
