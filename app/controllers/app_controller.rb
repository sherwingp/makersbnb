# frozen_string_literal: true

class Makersbnb < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  set :root, File.dirname(File.expand_path(__dir__))
  set :public_folder, 'public'
  configure :development do
    register Sinatra::Reloader
  end
end
