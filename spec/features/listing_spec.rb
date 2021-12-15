feature "List a space" do
  scenario "host can list a space" do
    visit('/spaces')
    # click_link('List a space')
    # fill_in :name, with: 'Makers'
    # fill_in :Location, with: 'London'
    # fill_in :Price, with: '100'
    # click_button('Submit')
    expect(page).to have_content('Book')
  end
end