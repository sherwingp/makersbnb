# frozen_string_literal: true

require_relative '../lib/database_connection'
require_relative './spaces'
require 'pg'

class Bookings
  attr_reader :id, :available_to, :available_from

  def initialize(id:, available_from:, available_to:) 
    @id = id
    @available_from = available_from
    @available_to = available_to
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

  def self.check_dates(available_from:, available_to:)
    ENV['ENVIRONMENT'] == 'test' ? DatabaseConnection.setup(dbname: 'makersbnb_test') : DatabaseConnection.setup(dbname: 'makersbnb') 
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE available_from = $1 AND available_to = $2", [available_from, available_to])
    result.map{|space| Spaces.new(location: space['location'], price: space['price'], host_id: space['host_id'], id: space['id'], available_from: space['available_from'], available_to: space['available_to'])}
  end
end

# make booking false by default.
