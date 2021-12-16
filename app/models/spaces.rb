# frozen_string_literal: true

require './lib/database_connection'
require 'pg'

class Spaces
  attr_reader :location, :price, :host_id, :id, :description

  

  def initialize(location:, price:, host_id:, id:, description:)
    @location = location
    @price = price
    @host_id = host_id
    @id = id
    @description = description
  end

  def self.create(location:, price:, description:, host_id:)
    result = DatabaseConnection.query(
      'INSERT INTO spaces (location, price, description, host_id) VALUES ($1, $2, $3, $4) RETURNING id, location, price, description, host_id;', [location,
                                                                                                                    price, description, host_id]
    )
    Spaces.new(location: result[0]['location'], price: result[0]['price'], description: result[0]['description'],
               id: result[0]['id'], host_id: result[0]['host_id'])
  end

  def self.list
    result = DatabaseConnection.query('SELECT * FROM spaces;')
    result.map do |space|
      Spaces.new(location: result[0]['location'], price: result[0]['price'], description: result[0]['description'],
        id: result[0]['id'], host_id: result[0]['host_id'])
    end
  end
end
