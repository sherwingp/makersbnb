require 'requests'

describe '.all' do
  it 'guests can see requests for all available nights' do
    connection = PG.connect(dbname: 'spaces_test')

    connection.exec("INSERT INTO spaces (location) VALUES ('Single bedroom in Camden');")
    connection.exec("INSERT INTO spaces (location) VALUES ('Double bedroom in Barking');")

    requests = Request.all
    expect(requests).to include("Single bedroom in Camden")
    expect(requests).to include("Double bedroom in Barking")
  end
end