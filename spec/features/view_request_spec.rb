# frozen_string_literal: true

feature 'View guest requests' do
  let!(:user) { User.create(first_name: 'Sherwin', last_name: 'Test', email: 'test@test.com', password: 'test') }
  let!(:space) { Spaces.create(location: 'Paris', price: '300', host_id: user.id, description: 'a space') }

  scenario "see all requests I've made for available nights" do

  end
end
