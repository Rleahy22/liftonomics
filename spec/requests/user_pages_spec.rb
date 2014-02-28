require 'spec_helper'

describe "User pages" do
  
  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  describe "signup page" do
    before { visit root_path }

    it { should have_content('Username') }
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