require 'pg'

def setup_test_database
  p 'Setting up test database...'
  connection = PG.connect(dbname: 'request_test')
  connection.exec('TRUNCATE requests;')
end
