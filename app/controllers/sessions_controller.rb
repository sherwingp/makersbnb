# frozen_string_literal: true

class Makersbnb < Sinatra::Base
  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      flash[:success] = "Welcome back #{user.first_name}!"
      session[:user] = user
    else
      session[:user] = nil
      flash[:error] = 'Invalid email or password'
    end
    redirect '/'
  end

  post '/sessions/logout' do
    session.clear
    redirect '/'
  end
end
