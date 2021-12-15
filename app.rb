require 'sinatra/base'
require 'sinatra/reloader'
require './models/bookings'
require './models/spaces'
require './models/database_connection'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/spaces' do
    
    # why does our list not work unless we add a database connection like above
      @spaces = Spaces.list
    erb :spaces
  end

  post '/spaces' do
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces/new' do
    Spaces.create(location: params[:Location], price: params[:Price], host_id: params[:name])
    redirect '/spaces'
  end

  run! if app_file == $0
end

