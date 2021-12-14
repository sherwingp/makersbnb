def sign_up
  visit '/'
  click_button 'Create New Account'
  fill_in('first_name', with: 'Sherwin')
  fill_in('last_name', with: 'Test')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  click_button('Sign Up')
end

def log_in
  visit '/'
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  click_button('Log In')
end


