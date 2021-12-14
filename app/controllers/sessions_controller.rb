class Makersbnb < Sinatra::Base

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password]) 
    if user
      session[:user] = user
    else
      session[:user] = nil
      flash[:error] = "Invalid email or password"
    end
    redirect '/'
  end

  post '/sessions/logout' do
    session.clear
    p session
    redirect '/'
  end
end