require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookings'
require './lib/spaces'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
  end

  run! if app_file == $0
end