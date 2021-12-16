require './lib/database_connection'
require 'pg'

class Request

  attr_reader :id, :space_id

  def initialize(id:, space_id:)
    @id = id
    @space_id = space_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM requests;")
    result.map do |request| 
      Request.new(id: request['id'], space_id: request['space_id'] )
    end
  end

  def self.create(space_id:)
    result = DatabaseConnection.query("INSERT INTO requests (space_id) VALUES($1) RETURNING id, approved, space_id;", [space_id])
    Request.new(id: result[0]['id'], space_id: result[0]['space_id'])
  end
end

