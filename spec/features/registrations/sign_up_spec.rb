# frozen_string_literal: true

feature 'Registration' do
  context 'Signing up' do
    scenario 'shows indication of sign up' do
      visit '/login'
      click_button 'Create New Account'
      fill_in('first_name', with: 'Sherwin')
      fill_in('last_name', with: 'Test')
      fill_in('email', with: 'test@test.com')
      fill_in('password', with: 'password')
      click_button('Sign Up')
      expect(page).to have_content('Registration successful.')
    end

    context 'Shows an error' do
      scenario 'when an invalid email is given' do
        visit '/login'
        click_button 'Create New Account'
        fill_in('first_name', with: 'Sherwin')
        fill_in('last_name', with: 'Test')
        fill_in('email', with: 'invalid email')
        fill_in('password', with: 'password')
        click_button('Sign Up')
        expect(page).to have_content('Please enter a valid email address.')
      end

      scenario 'when an existing email is given' do
        User.create(first_name: 'Sherwin', last_name: 'Test', email: 'test@test.com', password: 'password')
        visit '/login'
        click_button 'Create New Account'
        fill_in('first_name', with: 'Sherwin')
        fill_in('last_name', with: 'Test')
        fill_in('email', with: 'test@test.com')
        fill_in('password', with: 'password')
        click_button('Sign Up')
        expect(page).to have_content('An account already exists with this email address.')
      end
    end
  end
end
