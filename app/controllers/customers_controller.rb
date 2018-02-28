class CustomersController < ApplicationController
  def get_matching
    render json: Customer.get_nearby(100000).to_json
  end
end
