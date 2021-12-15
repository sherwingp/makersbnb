require 'sinatra/base'
require 'sinatra/reloader'
require './lib/requests'


class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/requests' do
    @requests = Request.all
    erb :requests
  end

  get '/requests/create' do
    erb :"requests/create"
  end

  post '/requests' do
    # p params
    # space_id = params['space_id']
    # connection = PG.connect(dbname: 'request_test')
    # result = connection.exec("INSERT INTO requests (space_id) VALUES('#{space_id}')")
    # p result
    Request.create(space_id: params[:space_id])
    redirect '/requests'
  end

  run! if app_file == $0
end