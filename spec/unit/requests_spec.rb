# frozen_string_literal: true

require './app/models/requests'

describe '.all' do
  it 'guests can see requests made for all available nights' do
    request = Request.create(space_id: 'space_1')
    Request.create(space_id: 'space_2')
    requests = Request.all

    expect(requests.length).to eq 2
    expect(requests.first).to be_a Request
    expect(requests.first.id).to eq request.id
    expect(requests.first.space_id).to eq 'space_1'
  end
end

describe '.create' do
  it 'creates a new request' do
    request = Request.create(space_id: 'space_1')

    expect(request).to be_a Request
    expect(request.space_id).to eq 'space_1'
  end
end
