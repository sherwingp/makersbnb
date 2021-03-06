# frozen_string_literal: true

class Makersbnb < Sinatra::Base
  get '/' do
    erb(:homepage)
  end

  get '/login' do
    erb(:'sessions/sign_in')
  end

  get '/register' do
    erb(:'registrations/sign_up')
  end

  post '/register' do
    result = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email],
                         password: params[:password])
    case result
    when 'invalid email'
      flash[:warning] = 'Please enter a valid email address.'
      redirect '/register'
    when 'email taken'
      flash[:warning] = 'An account already exists with this email address.'
      redirect '/register'
    else
      flash[:success] = 'Registration successful.'
      session[:user] = result
      redirect '/'
    end
  end
end
