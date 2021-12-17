# # frozen_string_literal: true

# feature 'Creating a new request' do
#   scenario 'A guest can create a new request' do
#     sign_up
#     log_in
#     visit('/spaces')
#     # click_link('List a space', href: '/spaces/new')
#     fill_in('description', with: 'a space')
#     fill_in('location', with: 'Paris')
#     fill_in('price', with: '100')
#     click_button('List my Space')
#     expect(page).to have_content 'Paris'
#   end
# end
