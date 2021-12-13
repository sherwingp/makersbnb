class Makersbnb < Sinatra::Base
  set :root, File.dirname(File.expand_path('..', __FILE__))
  configure :development do
    register Sinatra::Reloader
  end
end