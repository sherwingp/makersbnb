# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'

require_relative 'models/user'
require_relative 'models/spaces'
require_relative 'models/requests'

require_relative 'controllers/app_controller'
require_relative 'controllers/registrations_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/spaces_controller'
require_relative 'controllers/requests_controller'
