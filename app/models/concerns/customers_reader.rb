module CustomersReader
  def read_customers_data
    file = File.read('lib/customers.json')
    JSON.parse(file)
  rescue FileNotFoundException => e
    puts e.message
    puts e.backtrace.inspect
  rescue JSON::ParserError => e
    puts e.message
    puts e.backtrace.inspect
  end
end
