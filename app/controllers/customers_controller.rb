class CustomersController < ApplicationController
  def get_matching
    Customer.get_nearby.to_json
  end
end
