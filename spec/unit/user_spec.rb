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
      expect(user.email).to eq 'test@test.com'
    end
  end

  describe '.authenticate' do
    before(:each) do
      @user = User.create(
        first_name: 'Sherwin', 
        last_name: 'Test', 
        email: 'test@test.com', 
        password: 'test'
      )
    end
    it 'returns a user instance when given correct details' do
      expect(User.authenticate(email: @user.email, password: @user.password)).to be_a User
    end

    it 'returns nil when given a wrong email' do
      expect(User.authenticate(email: 'wrong email', password: @user.password)).to eq nil
    end

    it 'returns nil when given a wrong password' do
      expect(User.authenticate(email: @user.email, password: 'wrong password')).to eq nil
    end
  end
end