require 'test_helper'

class UserLogsIntoAccountTest < ActionDispatch::IntegrationTest
  test "registered user can log in and see dashboard" do
    # as a registered user
    user = User.create(username: "Kimiko", password: "password")

    visit login_path
    # fill in username with "Kimiko"
    fill_in "Username", with: user.username
    # fill in password with "password"
    fill_in "Password", with: "password"
    # click on submit button
    click_button "Login"

    assert page.has_content? "Welcome, #{user.username}"
  end
end
