require_relative './database_connection'
require 'pg'

class Spaces
  attr_reader :location, :price, :host_id

  def initialize (location:, price:, host_id:)
    @location = location
    @price = price
    @host_id = host_id
  end 

    def self.create(location:, price:, host_id:)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'makersbnb_test')
       else
        connection = PG.connect(dbname: 'makersbnb')
       end
     
      result = DatabaseConnection.query("INSERT INTO spaces (location, price, host_id) VALUES ($1, $2, $3) RETURNING id, location, price, host_id;", [location, price, host_id])
      Spaces.new(location: result[0]['location'], price: result[0]['price'], host_id: result[0]['host_id'])
    end


  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
     else
      connection = PG.connect(dbname: 'makersbnb')
     end
    result = DatabaseConnection.query('SELECT * FROM spaces;')
    result.map{|space| Spaces.new(location: space['location'], price: space['price'], host_id: space['host_id'])}
  end

  # def connect
  #   if ENV['ENVIRONMENT'] == 'test' 
  #     DatabaseConnection.setup('makersbnb_test')
  #   else
  #     DatabaseConnection.setup('makersbnb')
  #   end
  # end

end

  # def self.create(location:, price:, host_id:)
  #   connection = connect
  #   DatabaseConnection.setup('makersbnb_test')
  #   result = DatabaseConnection.query("INSERT INTO spaces (location, price, host_id) VALUES ($1, $2, $3) RETURNING id, location, price, host_id;" [location, price, host_id])
  #   Spaces.new (location: result[0]['location'], price: result[0]['price'], host_id: result[0]['host_id'])
  # end


  # def self.list
  #   connection = connect
  #   result = DatabaseConnection.query('SELECT * FROM spaces')
  #   result.map{|space| Spaces.new(location: spaces['location'], price: spaces['price'], host_id: spaces['host_id'])}
  # end

  # def connect
  #   if ENV['ENVIRONMENT'] == 'test' 
  #     DatabaseConnection.setup('makersbnb_test')
  #   else
  #     DatabaseConnection.setup('makersbnb')
  #   end
  # end


# end # where class ends