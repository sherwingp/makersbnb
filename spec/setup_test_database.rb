require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'spaces_test')
  connection.exec("TRUNCATE spaces;")
end