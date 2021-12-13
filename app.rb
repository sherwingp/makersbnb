require 'sinatra/base'
require 'sinatra/reloader'
require './lib/requests'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/requests' do
    @requests = Request.request_space
    erb :requests
  end

  run! if app_file == $0
end