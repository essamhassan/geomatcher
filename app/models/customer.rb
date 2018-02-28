class Customer
  extend CustomersReader

  def self.all
    read_customers_data
  end


  def self.get_nearby(offset)
    all_with_distance = all.map do |customer|
      customer[:distance] = Geo::DistanceCalculator.get_distance(customer["latitude"].to_f, customer["longitude"].to_f, Constants::Intercom::LATITUDE, Constants::Intercom::LONGITUDE )
      customer.symbolize_keys
    end

    all_with_distance.reject{|c| c[:distance] > offset }.sort_by {|c| c[:user_id] }
  end
end
