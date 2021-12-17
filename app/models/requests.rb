# frozen_string_literal: true

require './lib/database_connection'
require_relative './spaces'
require 'pg'

class Request
  attr_reader :id, :space_id, :guest_id, :host_id, :space, :available_from, :available_to

  def initialize(id:, space_id:, guest_id:, host_id:, space: Spaces, available_from:, available_to:)
    @id = id
    @space_id = space_id
    @guest_id = guest_id
    @host_id = host_id
    @space = space
    @available_from = available_from
    @available_to = available_to
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM requests;')
    result.map do |request|
      Request.new(id: request['id'], space_id: request['space_id'], guest_id: request['guest_id'],
                  host_id: request['host_id'], available_from: request['available_from'], available_to: request['available_to'])
    end
  end

  def self.create(space_id:, guest_id:, host_id:)
    result = DatabaseConnection.query(
      'INSERT INTO requests (space_id, guest_id, host_id) VALUES($1, $2, $3) RETURNING id, approved, space_id, guest_id, host_id;', [
        space_id, guest_id, host_id
      ]
    )
    Request.new(id: result[0]['id'], space_id: result[0]['space_id'], guest_id: result[0]['guest_id'],
                host_id: result[0]['host_id'])
  end
  
  # def self.find(id:)
  #   result = DatabaseConnection.query(
  #     'SELECT * FROM requests WHERE id = $1 RETURNING id, approved, space_id, guest_id, host_id;', [id]
  #   )
  #   Request.new(id: result['id'], approved: result['approved'], space_id: result['space_id'], guest_id: result['guest_id'],
  #     host_id: result['host_id'])
  # end
  #  MUST FIX

  def space(id:)
    result = DatabaseConnection.query('SELECT * FROM spaces WHERE id = $1', [id])
    @space.new(location: result[0]['location'], price: result[0]['price'], description: result[0]['description'],
               id: result[0]['id'], host_id: result[0]['host_id'], available_from: result[0]['available_from'], available_to: result[0]['available_to'])
  end

  def self.delete(id:)
    result = DatabaseConnection.query("DELETE FROM requests WHERE id = $1", [id])
  end

  def approve
    result = DatabaseConnection.query("UPDATE requests SET approved = true WHERE id = #{@id}")
    result = Request.new(id: result[0]['id'], space_id: result[0]['space_id'], guest_id: result[0]['guest_id'],
      host_id: result[0]['host_id'])
  end
end
