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
      flash[:error] = "You must be logged in to list a space."
    else
      Spaces.create(location: params[:Location], price: params[:Price], description: params[:description], host_id: session[:user].id)
    end
    
    redirect '/spaces'
  end

  get '/spaces/:id/book' do
    @spaces = Spaces.list
    @bookings = Bookings.find(id: params[:id])
    erb :booking
  end

  patch '/spaces/:id' do
    Bookings.book(id: params[:id])
    redirect '/spaces'
  end
end

