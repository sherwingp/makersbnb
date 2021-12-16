# frozen_string_literal: true

class Makersbnb < Sinatra::Base
  get '/spaces' do
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
    # Need to check if user logged in
    if session[:user].nil?
      flash[:error] = 'You must be logged in to list a space.'
    else
      Spaces.create(location: params[:Location], price: params[:Price], description: params[:description],
                    host_id: session[:user].id)
    end

    redirect '/spaces'
  end

  post '/spaces/:id/book' do
    @requests = Request.create(space_id: params[:space_id], guest_id: session[:user].id, host_id: params[:host_id])
    redirect '/requests'
  end
end
