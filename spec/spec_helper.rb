ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require 'capybara/rspec'
require 'pg'
require './app/app'
require 'simplecov'
require 'simplecov-console'
require_relative 'support/user_authentication'
require_relative 'support/setup_test_database'
Capybara.app = Makersbnb



SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start