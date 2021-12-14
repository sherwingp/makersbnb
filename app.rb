require 'sinatra/base'
require 'sinatra/reloader'
require './lib/requests_made'
require './lib/requests_received'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/requests' do
    @requests1 = Request_made.all
    @requests2 = Request_made.all
    erb :requests
  end

  get '/requests/create' do
    erb :"requests/create"
  end

  post '/requests' do
    # p params
    # p "working?"
    space_id = params['space_id']
    connection = PG.connect(dbname: 'request_test')
    connection.exec("INSERT INTO requests (space_id) VALUES('#{space_id}')")
    redirect '/requests'
  end

  run! if app_file == $0
end