require 'pg'

class Request

  attr_reader :id, :space_id

  def initialize(id:, space_id:)
    @id = id
    @space_id = space_id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'request_test')
    else
      connection = PG.connect(dbname: 'request')
    end

    result = connection.exec("SELECT * FROM requests;")
    result.map do |request| 
      Request.new(id: request['id'], space_id: request['space_id'] )
    end
  end

  def self.create(space_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'request_test')
    else
      connection = PG.connect(dbname: 'request')
    end

    result = connection.exec_params("INSERT INTO requests (space_id) VALUES($1) RETURNING id, approved, space_id;", [space_id])
    Request.new(id: result[0]['id'], space_id: result[0]['space_id'])
  end
end

# class Request_received
#   def self.all
#     if ENV['ENVIRONMENT'] == 'test'
#     connection = PG.connect(dbname: 'request_test')
#     else
#       connection = PG.connect(dbname: 'request')
#     end

#     result = connection.exec("SELECT * FROM requests;")
#     result.map { |request| request['space_id'] }
#   end
# end