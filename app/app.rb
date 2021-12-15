require 'sinatra/base'
require 'sinatra/reloader'
require_relative './models/bookings'
require_relative './models/spaces'
require_relative './lib/database_connection'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions, :method_override
  end

  get '/spaces' do
    # why does our list not work unless we add a database connection like above
      @spaces = Spaces.list
    erb :spaces
  end

  post '/spaces' do
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces/new' do
    Spaces.create(location: params[:Location], price: params[:Price], host_id: params[:name])
    redirect '/spaces'
  end

  get '/spaces/:id/book' do
    @spaces = Spaces.list
    @bookings = Bookings.find(id: params[:id])
    erb :booking
  end

  patch '/spaces/:id' do
    Bookings.book(id: params[:id])
    redirect '/spaces'
  end

  run! if app_file == $0
end

# get '/bookmarks/:id/edit' do
#   @bookmark = Bookmark.find(id: params[:id])
#   erb :"bookmarks/edit"
# end

# patch '/bookmarks/:id' do
#   Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
#   redirect('/bookmarks')
# end