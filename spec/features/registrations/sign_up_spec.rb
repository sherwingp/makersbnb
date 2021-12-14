feature 'Registration' do

  context 'Signing up' do
    scenario 'shows indication of sign up' do
      visit '/'
      click_button 'Create New Account'
      fill_in('first_name', with: 'Sherwin')
      fill_in('last_name', with: 'Test')
      fill_in('email', with: 'test@test.com')
      fill_in('password', with: 'password')
      click_button('Sign Up')
      expect(page).to have_content("Sherwin")
    end

    context 'Shows an error' do
      scenario 'when an invalid email is given' do
        visit '/'
        click_button 'Create New Account'
        fill_in('first_name', with: 'Sherwin')
        fill_in('last_name', with: 'Test')
        fill_in('email', with: 'test@test')
        fill_in('password', with: 'password')
        click_button('Sign Up')
        expect(page).to have_content("Invalid email")
      end
    end
  end
end