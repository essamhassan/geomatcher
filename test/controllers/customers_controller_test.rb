require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "get nearby customers" do
    get get_nearby
    assert_response :success
  end
end
