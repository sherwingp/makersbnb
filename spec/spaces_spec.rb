require 'pg'
require_relative '../models/spaces'
require_relative '../models/database_connection'

describe Spaces do
  describe '.create' do
    it 'allows the host to create a space' do
      connection_test = DatabaseConnection.setup('makersbnb_test')
      spaces = Spaces.create(location: 'Spain', price: '300', host_id: 'host_6')
      expect(spaces.location).to eq 'Spain'
    end
  end

  
  describe '.list' do
    it 'displays all the spaces' do
      connection_test = DatabaseConnection.setup('makersbnb_test')
      space = Spaces.create(location: 'Spain', price: '300', host_id: 'host_6')
      # Spaces.create(location: 'London', price: '200', host_id: 'host_8')
      spaces = Spaces.list
      expect(spaces.list.location).to eq 'Spain'
      # expect(spaces.first.price).to eq '300'
      # expect(spaces.second.location).to eq 'London'
    end
  end

end
  


# describe Bookmark do
#   describe '.all' do
#     it 'returns a list of bookmarks' do
#       connection = PG.connect(dbname: 'bookmark_manager_test')
#       bookmark = Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
#       Bookmark.create(url: 'http://www.google.com/', title: 'Google')
#       Bookmark.create(url: 'http://www.destroyallsoftware.com/', title: 'Destroy All Software')

#       bookmarks = Bookmark.all

#       expect(bookmarks.length).to eq 3
#       expect(bookmarks.first).to be_a Bookmark
#       expect(bookmarks.first.id).to eq bookmark.id
#       expect(bookmarks.first.title).to eq 'Makers Academy'
#       expect(bookmarks.first.url).to eq 'http://www.makersacademy.com/'
#     end
#   end