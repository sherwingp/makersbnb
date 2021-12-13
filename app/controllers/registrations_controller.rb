class Makersbnb < Sinatra::Base

get '/' do
  erb(:'sessions/sign_in')
end

get '/register' do
  erb(:'registrations/sign_up')
end


post '/register' do
  redirect '/'
end
end