feature 'Registration' do
  context 'Signing up' do
    scenario 'shows indication of sign up' do
      sign_up
      expect(page).to have_content("Sherwin")
    end
  end
end