
require_relative '../models/spaces'
require_relative '../models/database_connection'

describe Spaces do
  describe '.create' do
    it 'allows the host to create a space' do
      connection_test = DatabaseConnection.setup('makersbnb_test')
      spaces = Spaces.create(location: 'Paris', price: '300', host_id: 'host_9')
      expect(spaces.location).to eq 'Paris'
    end
  end

  
  describe '.list' do
    it 'displays all the spaces' do
      connection_test = DatabaseConnection.setup('makersbnb_test')
      Spaces.create(location: 'Lahore', price: '300', host_id: 'host_7')
       Spaces.create(location: 'London', price: '200', host_id: 'host_8')
      spaces = Spaces.list
       expect(spaces.first.price).to eq '300.00'
      # expect(spaces.second.location).to eq 'London'
    end
  end

end
  