require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "test correct customer format" do
    expect(Customer.all).to be_a(Array)
  end
end
