# frozen_string_literal: true

require './lib/database_connection'
require 'bcrypt'

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
    return 'invalid email' if (email =~ URI::MailTo::EMAIL_REGEXP).nil?
    return 'email taken' unless unique?(email)

    password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
      "INSERT INTO users (first_name, last_name, email, password) VALUES($1, $2, $3, $4)
        RETURNING id, first_name, last_name, email, password;", [first_name, last_name, email, password]
    )
    instantiate(result)
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query('SELECT * FROM users WHERE email = $1', [email])
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    instantiate(result)
  end
end

private

def instantiate(result)
  User.new(id: result[0]['id'], first_name: result[0]['first_name'], last_name: result[0]['last_name'],
           email: result[0]['email'], password: result[0]['password'])
end

def unique?(email)
  DatabaseConnection.query('SELECT EXISTS(SELECT 1 FROM users WHERE email = $1)',
                           [email])[0]['exists'] == 'f'
end
