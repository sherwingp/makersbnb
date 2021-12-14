feature 'logging in' do
  scenario 'gives an indication of logging in' do
    sign_up
    log_in
    expect(page).to have_content "Sherwin"
  end
end