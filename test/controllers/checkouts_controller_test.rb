require "test_helper"

class CheckoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get checkouts_create_url
    assert_response :success
  end

  test "should get success" do
    get checkouts_success_url
    assert_response :success
  end

  test "should get cancel" do
    get checkouts_cancel_url
    assert_response :success
  end
end
