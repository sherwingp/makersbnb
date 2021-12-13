def sign_up
  visit '/'
  click_button 'Create New Account'
  fill_in('name', with: 'Test')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  click_button('Sign up')
end

