# frozen_string_literal: true

require './app/models/requests'
require './app/models/user'
require './app/models/user'

describe Request do
  let(:user) { User.create(first_name: 'Sherwin', last_name: 'Test', email: 'test@test.com', password: 'test') }
  let(:space) { Spaces.create(location: 'Paris', price: '300', host_id: user.id, description: 'a space') }

  describe '.all' do
    it 'guests can see requests made for all available nights' do
      request = Request.create(space_id: space.id, guest_id: user.id, host_id: user.id)
      request2 = Request.create(space_id: space.id, guest_id: user.id, host_id: user.id)
      requests = Request.all

      expect(requests.length).to eq 2
      expect(requests.first).to be_a Request
      expect(requests.first.id).to eq request.id
      expect(requests.first.space_id).to eq space.id
    end
  end

  describe '.create' do
    it 'creates a new request' do
      request = Request.create(space_id: space.id, guest_id: user.id, host_id: user.id)

      expect(request).to be_a Request
      expect(request.space_id).to eq space.id
    end
  end
end
