require 'requests_received'

describe '.all' do
  it 'guests can see requests received for all available nights' do
    connection = PG.connect(dbname: 'request_test')

    connection.exec("INSERT INTO requests (approved, space_id) VALUES ('Yes', 1);")
    connection.exec("INSERT INTO requests (approved, space_id) VALUES ('No', 2);")

    requests = Request_received.all
    expect(requests).to include("1")
    expect(requests).to include("2")
  end
end