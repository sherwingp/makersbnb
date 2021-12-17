# frozen_string_literal: true

class Makersbnb < Sinatra::Base
  get '/requests' do
    @requests = Request.all
    if session[:user].nil?
      flash[:error] = 'You must be logged in view requests.'
      redirect '/'
    else
      @requests_made = @requests.map { |request| request if session[:user].id == request.guest_id }
      @received_requests = @requests.map { |request| request if session[:user].id == request.host_id }
      erb :requests
    end
  end

  get '/requests/create' do
    erb :"requests/create"
  end

  post '/requests' do
    Request.create(space_id: params[:space_id])
    redirect '/requests'
  end

  post '/requests/:id/approve' do
    request.approve
    flash[:success] = 'Your space has been approved!'
    redirect '/requests'
  end
end
