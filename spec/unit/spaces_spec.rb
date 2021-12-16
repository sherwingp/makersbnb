# frozen_string_literal: true

require './app/models/spaces'
require './app/models/user'

ENV['ENVIRONMENT'] = 'test'

describe Spaces do
  let(:user) { User.create(first_name: 'Sherwin', last_name: 'Test', email: 'test@test.com', password: 'test') }

  describe '.create' do
    it 'allows the host to create a space' do
      spaces = Spaces.create(location: 'Paris', price: '300', host_id: user.id, description: 'a space')
      expect(spaces.location).to eq 'Paris'
    end
  end

  describe '.list' do
    it 'displays all the spaces' do
      Spaces.create(location: 'Lahore', price: '300', host_id: user.id, description: 'a space')
      Spaces.create(location: 'London', price: '200', host_id: user.id, description: 'a space')
      spaces = Spaces.list
      expect(spaces.first.price).to eq '300'
      expect(spaces.first.location).to eq 'Lahore'
      expect(spaces.length).to eq 2
    end
  end
end
