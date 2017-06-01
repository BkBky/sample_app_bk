require 'test_helper'

# Listing 7.23: A test for an invalid signup
class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    follow_redirect!
    assert_template 'users/show'
    # assert_not flash.empty?
    # assert_template 'users/new'
    # assert_select 'div#error_explanation'
    # assert_select 'div.field_with_errors'
  end
end
