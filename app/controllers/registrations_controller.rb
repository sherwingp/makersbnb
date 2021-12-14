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
  user = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name], 
    email: params[:email], 
    password: params[:password]
  )
  session[:user] = user
  redirect '/'
end
end