require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  test "should get root" do
    get static_pages_home_url
    assert_response :success
  end

  # this is a test
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    # checks for the presence of a <title> tag containing the string “Home | Ruby on Rails Tutorial Sample App”
    # code without refactoring
    # assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
    # # Refactoring line 13
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success

    assert_select "title", "About | #{@base_title}"
  end
  # test for the existence of a page at the URL /static_pages/contact by testing for the title “Contact | Ruby on Rails Tutorial Sample App”
  test "should get contact" do
    get static_pages_contact_url
    assert_response :success

    assert_select "title", "Contact | #{@base_title}"
  end

end
