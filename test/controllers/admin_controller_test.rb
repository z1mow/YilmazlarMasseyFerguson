require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get contacts" do
    get admin_contacts_url
    assert_response :success
  end

  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_show_url
    assert_response :success
  end
end
