# # frozen_string_literal: true

# feature 'View guest requests' do
#   scenario "see all requests I've made for available nights" do
#     sign_up
#     log_in
#     visit('/spaces')
#     click_link('List a space', href: '/spaces/new')
#     fill_in('description', with: 'a space')
#     fill_in('location', with: 'Paris')
#     fill_in('price', with: '100')
#     click_button('List my Space')
#     click_button 'Book'
#     expect(page).to have_content 'Paris'
#   end
# end
