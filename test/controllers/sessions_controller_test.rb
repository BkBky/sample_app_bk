require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    # used until chapter 7
    # get sessions_new_url
    get login_path
    assert_response :success
  end

end
