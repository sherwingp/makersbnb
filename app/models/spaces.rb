# frozen_string_literal: true

require './lib/database_connection'
require 'pg'

class Spaces
  attr_reader :location, :price, :host_id, :id

  def testing
    'hello'
  end

  def initialize(location:, price:, host_id:, id:)
    @location = location
    @price = price
    @host_id = host_id
    @id = id
  end

  def self.create(location:, price:, host_id:)
    result = DatabaseConnection.query(
      'INSERT INTO spaces (location, price, host_id) VALUES ($1, $2, $3) RETURNING id, location, price, host_id;', [location,
                                                                                                                    price, host_id]
    )
    Spaces.new(location: result[0]['location'], price: result[0]['price'], host_id: result[0]['host_id'],
               id: result[0]['id'])
  end

  def self.list
    result = DatabaseConnection.query('SELECT * FROM spaces;')
    result.map do |space|
      Spaces.new(location: space['location'], price: space['price'], host_id: space['host_id'], id: space['id'])
    end
  end
end
