# frozen_string_literal: true

class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :root, File.dirname(File.expand_path(__dir__))
  configure :development do
    register Sinatra::Reloader
  end
end
