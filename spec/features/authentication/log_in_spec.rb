# frozen_string_literal: true

feature 'logging in' do
  let!(:user) { User.create(first_name: 'Sherwin', last_name: 'Test', email: 'test@test.com', password: 'password') }
  scenario 'gives an indication of logging in' do
    log_in
    expect(page).to have_content 'Sherwin'
  end

  context 'with an invalid email' do
    scenario 'shows an error message' do
      visit '/login'
      fill_in('email', with: 'invalid email')
      fill_in('password', with: 'password')
      click_button('Log In')
      expect(page).to have_content 'Invalid email or password'
    end
  end

  context 'with an invalid password' do
    scenario 'shows an error message' do
      visit '/login'
      fill_in('email', with: 'test@test.com')
      fill_in('password', with: 'wrong password')
      click_button('Log In')
      expect(page).to have_content 'Invalid email or password'
    end
  end
end
