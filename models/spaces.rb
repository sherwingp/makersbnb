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

  #   def self.create(url:, title:)
  #     if ENV['ENVIRONMENT'] == 'test'
  #      connection = PG.connect(dbname: 'bookmark_manager_test')
  #     else
  #      connection = PG.connect(dbname: 'bookmark_manager')
  #     end
  
  #     # I've broken it on to twp lines to make it a bit more readable
  #     result = connection.exec_params(
  #       # The first argument is our SQL query template
  #       # The second argument is the 'params' referred to in exec_params
  #       # $1 refers to the first item in the params array
  #       # $2 refers to the second item in the params array
  #       "INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title]
  #     )
  #     Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  # end

  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
     else
      connection = PG.connect(dbname: 'makersbnb')
     end
    result = DatabaseConnection.query('SELECT * FROM spaces')
    result.map{|space| Spaces.new(location: spaces['location'], price: spaces['price'], host_id: spaces['host_id'])}
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