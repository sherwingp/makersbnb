feature 'View guest requests' do
  scenario 'see a request for available nights' do
      
    visit('/requests')

    expect(page).to have_content "Requests I have made"
    expect(page).to have_content "Requests I have received"
  end
end