feature 'View guest requests' do
  scenario "see all requests I've made for available nights" do
    Request.create(space_id: 'space_1')
    Request.create(space_id: 'space_2')
    visit('/requests')

    expect(page).to have_content 'space_1'
    expect(page).to have_content 'space_2'
  end
end