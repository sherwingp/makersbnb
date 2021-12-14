feature 'logging out' do
  scenario 'by clicking logout button logs out' do
    sign_up
    log_in
    click_button "Log Out"
    expect(page).to have_content "Log In"
    expect(page).not_to have_content "Sherwin"
  end
end