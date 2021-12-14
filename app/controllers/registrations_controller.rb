class Makersbnb < Sinatra::Base

get '/' do
  if session[:user]
    erb(:homepage) 
  else
    erb(:'sessions/sign_in') 
  end
end

get '/register' do
  erb(:'registrations/sign_up')
end


post '/register' do
  result = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  case result
  when  "invalid email"
    flash[:error] = "Please enter a valid email address."
  when "email taken"
    flash[:error] = "An account already exists with this email address."
  else
    session[:user] = result
    redirect '/'
  end
end
end