require_relative './database_connection'
require_relative './spaces'
require 'pg'


class Bookings

  def self.book(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
     else
      connection = PG.connect(dbname: 'makersbnb')
     end
     result = DatabaseConnection.query('UPDATE spaces SET booked = TRUE WHERE id = $1;',[id])
     
  end

end
