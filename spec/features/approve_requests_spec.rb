feature 'Approvals' do
  scenario 'can approve a booking' do
    sign_up
    log_in
    visit('/spaces')
    click_link('List a space', href: '/spaces/new')
    fill_in('description', with: 'a space')
    fill_in('location', with: 'Paris')
    fill_in('price', with: '100')
    click_button('List my Space')
    click_button 'Book'
    visit('/requests')
    click_button('Approve')

    expect(page).to have_content('Your space has been approved!')

  end
end