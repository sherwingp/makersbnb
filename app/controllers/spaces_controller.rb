# frozen_string_literal: true

class Makersbnb < Sinatra::Base
  get '/spaces' do
    @spaces = Spaces.list
    p @spaces
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
      redirect '/spaces/new'
    else
      Spaces.create(location: params[:location], price: params[:price], description: params[:description],
                    host_id: session[:user].id, available_from: params[:available_from], available_to: params[:available_to])
      redirect '/spaces'
    end

    redirect '/spaces'
  end

  post '/spaces/:id/book' do
    if session[:user].nil?
      flash[:error] = 'You must be logged in to book a space.'
      redirect '/spaces'
    else
      @requests = Request.create(space_id: params[:space_id], guest_id: session[:user].id, host_id: params[:host_id])
      redirect '/requests'
    end
  end
 
  patch '/spaces' do
    Bookings.check_dates(available_from: params[:available_from], available_to: params[:available_to])
    erb :spaces
  end

  delete '/spaces/:id' do
    if session[:user].nil?
      flash[:error] = 'You must be logged in to book a space.'
      redirect '/spaces'
    else
    Spaces.delete(id: params[:space_id])
    redirect '/spaces'
  end
end

end
