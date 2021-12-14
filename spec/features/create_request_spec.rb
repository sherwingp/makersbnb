feature 'Creating a new request' do
    scenario 'A guest can create a new request' do
      visit('/requests/create')
      fill_in('space_id', with: '1')
      click_button('Submit')
  
      expect(page).to have_content '1'
    end
  end