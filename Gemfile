# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.2'

gem 'bcrypt'
gem 'pg'
gem 'sinatra'
gem 'sinatra-flash'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'rubocop-rspec', require: false
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'sinatra-contrib'
end

group :development, :test do
  gem 'rubocop', '1.20'
end
