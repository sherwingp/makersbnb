feature 'View guest requests' do
  scenario "see all requests I've made for available nights" do

    connection = PG.connect(dbname: 'request_test')

    connection.exec("INSERT INTO requests (approved, space_id) VALUES ('Yes', 1);")
    connection.exec("INSERT INTO requests (approved, space_id) VALUES ('No', 2);")
      
    visit('/requests')

    expect(page).to have_content "1"
    expect(page).to have_content "2"
  end

  scenario "see all requests I've received for available nights" do

    connection = PG.connect(dbname: 'request_test')

    connection.exec("INSERT INTO requests (approved, space_id) VALUES ('Yes', 1);")
    connection.exec("INSERT INTO requests (approved, space_id) VALUES ('No', 2);")
      
    visit('/requests')

    expect(page).to have_content "1"
    expect(page).to have_content "2"
  end
end