require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get foo" do
    get home_foo_url
    assert_response :success
  end

  test "should get bar" do
    get home_bar_url
    assert_response :success
  end

  test "should get baz" do
    get home_baz_url
    assert_response :success
  end

end
