include ApplicationHelper

def sign_in(user)
  visit root_path
  fill_in "Username:", with: user.username
  fill_in "Password:", with: user.password
  click_button "Login"
end

def sign_out
  visit root_path
  click_link "Sign Out"
end