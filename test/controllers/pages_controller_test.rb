require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get View" do
    get :View
    assert_response :success
  end

  test "should get Create" do
    get :Create
    assert_response :success
  end

  test "should get History" do
    get :History
    assert_response :success
  end

  test "should get About" do
    get :About
    assert_response :success
  end

end
