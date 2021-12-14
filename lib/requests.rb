
require 'pg'

class Request
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'spaces_test')
    else
      connection = PG.connect(dbname: 'spaces')
    end

    result = connection.exec("SELECT * FROM spaces;")
    result.map { |spaces| spaces['location'] }
  end
end