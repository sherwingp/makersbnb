require './app/models/user'

describe User do
  describe '.create' do
    it 'returns a persisted user instance' do
      user = User.create(
        first_name: 'Sherwin', 
        last_name: 'Test', 
        email: 'test@test.com', 
        password: 'test'
      )
      expect(user.id).not_to eq nil
      expect(user.first_name).to eq 'Sherwin'
      expect(user.email).go eq 'test@test.com'
    end
  end
end