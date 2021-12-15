# frozen_string_literal: true

feature 'logging out' do
  scenario 'by clicking logout button logs out' do
    sign_up
    click_button 'Log Out'
    expect(page).to have_current_path('/')
  end
end
