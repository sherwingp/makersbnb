feature "List & Viewing a space" do
  scenario "host can list a space and then view the space" do
    visit('/spaces')
    click_link('List a space')
    fill_in :name, with: 'Makers'
    fill_in :Location, with: 'London'
    fill_in :Price, with: '100'
    click_button('Submit')
    expect(page).to have_content('Makers')
  end
end