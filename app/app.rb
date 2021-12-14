ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'

require_relative 'models/user'

require_relative 'controllers/app_controller'
require_relative 'controllers/registrations_controller'