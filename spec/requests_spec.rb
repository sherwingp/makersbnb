require 'requests'

describe MakersBnB do
  it 'guests cans see a request for available nights' do
    requests = Request.request_space
    expect(requests).to include('Requests I have made')
    expect(requests).to include('Requests I have received')
  end
end