require './lib/database_connection'

class User
  attr_reader :id, :first_name, :last_name, :email, :password

  def initialize(id:, first_name:, last_name:, email:, password:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
  end

  def self.create(first_name:, last_name:, email:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (first_name, last_name, email, password) VALUES($1, $2, $3, $4) 
        RETURNING id, first_name, last_name, email, password;", [first_name, last_name, email, password])
    User.new(id: result[0]['id'], first_name: result[0]['first_name'], last_name: result[0]['last_name'], email: result[0]['email'], password: result[0]['password'])
  end
end