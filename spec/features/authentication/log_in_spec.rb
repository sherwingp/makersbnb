feature 'logging in' do
  scenario 'gives an indication of logging in' do
    sign_up
    log_in
    expect(page).to have_content "Sherwin"
  end

  context 'with an invalid email' do
    scenario 'gives an indication of logging in' do
      sign_up
      log_in
      expect(page).to have_content "Invalid email or pasword"
    end
  end

  context 'with an invalid password' do
    scenario 'gives an indication of logging in' do
      sign_up
      log_in
      expect(page).to have_content "Invalid email or password"
    end
  end
end