feature 'View guest requests' do
  scenario "see all requests I've made for available nights" do

    connection = PG.connect(dbname: 'request_test')

    connection.exec("INSERT INTO requests (approved, space_id) VALUES ('Yes', 1);")
    connection.exec("INSERT INTO requests (approved, space_id) VALUES ('No', 2);")
      
    visit('/requests')

    expect(page).to have_content "t"
    expect(page).to have_content "f"
  end

  scenario "see all requests I've received for available nights" do

    connection = PG.connect(dbname: 'request_test')

    connection.exec("INSERT INTO requests (approved, space_id) VALUES ('Yes', 1);")
    connection.exec("INSERT INTO requests (approved, space_id) VALUES ('No', 2);")
      
    visit('/requests')

    expect(page).to have_content "t"
    expect(page).to have_content "f"
  end
end