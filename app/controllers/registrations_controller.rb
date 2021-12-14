class Makersbnb < Sinatra::Base

get '/' do
  erb(:'sessions/sign_in')
end

get '/register' do
  erb(:'registrations/sign_up')
end


post '/register' do
  User.create(
    first_name: params[:first_name],
    last_name: params[:last_name], 
    email: params[:email], 
    password: params[:password]
  )
  redirect '/'
end
end