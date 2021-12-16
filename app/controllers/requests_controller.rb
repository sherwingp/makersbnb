

class Makersbnb < Sinatra::Base
  get '/requests' do
    @requests = Request.all
    erb :requests
  end

  get '/requests/create' do
    erb :"requests/create"
  end

  post '/requests' do
    Request.create(space_id: params[:space_id])
    redirect '/requests'
  end

end