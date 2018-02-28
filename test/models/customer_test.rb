require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "correct customer format" do
     assert_instance_of Array, Customer.all
  end

  test "not empty customers list" do
    refute_empty Customer.all
  end

  test "correct keys in customer hash" do
     customer = Customer.all.first
     assert_includes customer.keys, "latitude"
     assert_includes customer.keys, "longitude"
     assert_includes customer.keys, "user_id"
  end

  test "get nearby return filtered customers" do
    all_customers     = Customer.all
    nearby_customers  = Customer.get_nearby(100000)
    assert_operator all_customers.size, :>=, nearby_customers.size
  end

  test "nearby users sorted by user id" do
    is_sorted = Customer.get_nearby(100000).each_cons(2).all?{|p, n| (p[:user_id] <=> n[:user_id]) != 1}
    assert_equal is_sorted, true
  end

  test "geo distance returns correct value" do
     distance = Geo::DistanceCalculator.get_distance(53.339428, -6.257664, 29.956200, 31.276977)
     assert_equal distance, 3983865.7201014515
  end
end
