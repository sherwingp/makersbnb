require 'requests'

describe '.all' do
  it 'guests can see requests made for all available nights' do
    connection = PG.connect(dbname: 'request_test')

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
    persisted_data = PG.connect(dbname: 'request_test').query("SELECT * FROM requests WHERE id = #{request.id};")

    expect(request).to be_a Request
    expect(request.id).to eq persisted_data.first['id']
    expect(request.space_id).to eq 'space_1'
  end
end

# require 'requests_received'

# describe '.all' do
#   it 'guests can see requests received for all available nights' do
#     connection = PG.connect(dbname: 'request_test')

#     connection.exec("INSERT INTO requests (approved, space_id) VALUES ('Yes', 1);")
#     connection.exec("INSERT INTO requests (approved, space_id) VALUES ('No', 2);")

#     requests = Request_received.all
#     expect(requests).to include("1")
#     expect(requests).to include("2")
#   end
# end
