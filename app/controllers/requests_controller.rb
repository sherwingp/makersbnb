# frozen_string_literal: true

class Makersbnb < Sinatra::Base
  get '/requests' do
    @requests = Request.all
    @requests_made = @requests.map { |request| request if session[:user].id == request.guest_id }
    @received_requests = @requests.map { |request| request if session[:user].id == request.host_id }
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
