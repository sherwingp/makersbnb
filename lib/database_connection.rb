require 'pg'

class DatabaseConnection
  def self.setup
    dbname = if ENV['ENVIRONMENT'] == 'test'
               'makersbnb_test'
             else
               'makersbnb'
             end
    @connection = PG.connect(dbname: dbname)
  end

  class << self
    attr_reader :connection
  end

  def self.query(sql, params = [])
    setup
    @connection.exec_params(sql, params)
  end
end
