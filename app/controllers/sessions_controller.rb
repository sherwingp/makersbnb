class Makersbnb < Sinatra::Base

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])  
    session[:user] = user
    redirect '/'
  end
  end