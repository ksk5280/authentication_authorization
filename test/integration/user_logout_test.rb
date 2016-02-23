require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "the truth" do
    user = User.create(username: "Kimiko", password: "password")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content? "Welcome, #{user.username}"

    click_link "Logout"
    refute page.has_content? "Welcome, #{user.username}"
  end
end
