# frozen_string_literal: true

require_relative '../app/models/spaces'
require_relative '../app/lib/database_connection'
ENV['ENVIRONMENT'] = 'test'

describe Spaces do
  describe '.create' do
    it 'allows the host to create a space' do
      spaces = Spaces.create(location: 'Paris', price: '300', host_id: 'host_9')
      expect(spaces.location).to eq 'Paris'
    end
  end

  describe '.list' do
    it 'displays all the spaces' do
      Spaces.create(location: 'Lahore', price: '300', host_id: 'host_7')
      Spaces.create(location: 'London', price: '200', host_id: 'host_8')
      spaces = Spaces.list
      expect(spaces.first.price).to eq '300.00'
      expect(spaces.first.location).to eq 'Lahore'
      expect(spaces.length).to eq 2
    end
  end
end
