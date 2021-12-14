feature 'View guest requests' do
  scenario 'see all request for available nights' do

    connection = PG.connect(dbname: 'spaces_test')

    connection.exec("INSERT INTO spaces (location) VALUES ('Single bedroom in Camden');")
    connection.exec("INSERT INTO spaces (location) VALUES ('Double bedroom in Barking');")
      
    visit('/requests')

    expect(page).to have_content "Single bedroom in Camden"
    expect(page).to have_content "Double bedroom in Barking"
  end
end