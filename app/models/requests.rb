require './lib/database_connection'
require_relative './spaces'
require 'pg'

class Request

  attr_reader :id, :space_id, :guest_id, :host_id, :space

  def initialize(id:, space_id:, guest_id:, host_id: space = Spaces)
    @id = id
    @space_id = space_id
    @guest_id = guest_id
    @host_id = host_id
    @space = space
    @space_object
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM requests;")
    result.map do |request| 
      Request.new(id: request['id'], space_id: request['space_id'], guest_id: request['guest_id'], host_id: request['host_id'] )
    end
  end

  def self.create(space_id:, guest_id:, host_id:)
    result = DatabaseConnection.query("INSERT INTO requests (space_id, guest_id, host_id) VALUES($1, $2, $3) RETURNING id, approved, space_id, guest_id, host_id;", [space_id, guest_id, host_id])
    Request.new(id: result[0]['id'], space_id: result[0]['space_id'], guest_id: result[0]['guest_id'], host_id: result[0]['host_id'])
  end

  def space(id)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE id = $1", [id])
    @space_object = space.new(id: result[0]['id'], description: result[0]['description'], location: result[0]['location'], price: result[0]['price'])
  end
end

