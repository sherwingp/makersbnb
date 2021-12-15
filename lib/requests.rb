
require 'pg'

class Request
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'request_test')
    else
      connection = PG.connect(dbname: 'request')
    end

    result = connection.exec("SELECT * FROM requests;")
    result.map { |request| request['space_id'] }
  end

  def self.create(space_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'request_test')
    else
      connection = PG.connect(dbname: 'request')
    end

    connection.exec("INSERT INTO requests (space_id) VALUES('#{space_id}')")
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