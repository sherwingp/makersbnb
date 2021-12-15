require 'requests'

describe '.create' do
  it 'creates a new request' do
    Request.create(space_id: '1')
  
    expect(Request.all).to include '1'
  end
end