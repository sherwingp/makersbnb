# frozen_string_literal: true

require './lib/database_connection'
require 'pg'

class Spaces
  attr_reader :location, :price, :host_id, :id, :description, :available_to, :available_from

  def initialize(location:, price:, host_id:, id:, description:, available_from:, available_to:)
    @location = location
    @price = price
    @host_id = host_id
    @id = id
    @description = description
    @available_from = available_from
    @available_to = available_to
  end

  def self.create(location:, price:, description:, host_id:, available_from:, available_to:)
    result = DatabaseConnection.query(
      'INSERT INTO spaces (location, price, description, host_id, available_from, available_to) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id, location, price, description, host_id, available_from, available_to;', [location,
                                                                                                                                                  price, description, host_id, available_from, available_to]
    )
    Spaces.new(location: result[0]['location'], price: result[0]['price'], description: result[0]['description'],
               id: result[0]['id'], host_id: result[0]['host_id'], available_from: result[0]['available_from'], available_to: result[0]['available_to'] )
  end

  def self.list
    result = DatabaseConnection.query('SELECT * FROM spaces;')
    result.map do |space|
      Spaces.new(location: space['location'], price: space['price'], description: space['description'],
                 id: space['id'], host_id: space['host_id'], available_from: space['available_from'], available_to: space['available_to'])
    end
  end

  def self.delete(id:)
    result = DatabaseConnection.query("DELETE FROM spaces WHERE id = $1", [id])

  end
end
