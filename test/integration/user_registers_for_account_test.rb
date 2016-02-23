require 'test_helper'

class UserRegistersForAccountTest < ActionDispatch::IntegrationTest
  test "valid user sees name on dashboard" do
    # visit root path
    visit '/'

    # click on the "register" button or link
    click_on "register"

    # fill in username with "Kimiko"
    fill_in "Username", with: "Kimiko"
    # fill in password with "password"
    fill_in "Password", with: "password"

    # click "create account"
    click_on "Create Account"

    user = User.last

    # url should reflect my dashboard
    assert_equal "/users/#{user.id}", current_path

    # I should see a message "Welcome, Kimiko"
    assert page.has_content? "Welcome, #{user.username}"
  end
end
