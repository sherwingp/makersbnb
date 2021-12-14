
require 'pg'

class Request_made
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'request_test')
    else
      connection = PG.connect(dbname: 'request')
    end

    result = connection.exec("SELECT * FROM requests;")
    result.map { |request| request['approved'] }
  end
end