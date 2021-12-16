# frozen_string_literal: true

require_relative '../lib/database_connection'
require_relative './spaces'
require 'pg'

class Bookings
  attr_reader :id

  def initialize(id:)
    @id = id
  end

  def self.book(id:)
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup(dbname: 'makersbnb_test')
    else
      DatabaseConnection.setup(dbname: 'makersbnb')
    end
    result = DatabaseConnection.query('UPDATE spaces SET booked = TRUE WHERE id = $1;', [id])
  end

  def self.find(id:)
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup(dbname: 'makersbnb_test')
    else
      DatabaseConnection.setup(dbname: 'makersbnb')
    end
    result = DatabaseConnection.query(
      'SELECT * FROM spaces WHERE id = $1', [id]
    )
    Spaces.new(location: result[0]['location'], price: result[0]['price'], host_id: result[0]['host_id'],
               id: result[0]['id'])
  end

 def check_dates
  "hello"
 end

 def sherwin
  'prince'
 end

end

# make booking false by default.
