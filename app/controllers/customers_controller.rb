class CustomersController < ApplicationController
  def get_matching
    render json: Customer.get_nearby.to_json
  end
end
