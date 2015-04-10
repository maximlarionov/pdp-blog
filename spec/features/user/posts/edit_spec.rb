# require 'rails_helper'

# feature 'Edit Posts', js: true do
#   let(:user) { create(:user, :confirmed) }
#   let(:another_user) { create(:user, :confirmed) }

#   let!(:post) { create(:post, user: user, title: 'My Post') }
#   let!(:another_post) { create(:post, user: another_user, title: 'His post') }

#   before do
#     login_as user

#     visit posts_path
#   end

#   scenario 'edit with correct data' do
#     within(".index-buttons") do
#       click_link 'Edit'
#     end

#     fill_in 'Title', with: 'New Title'
#     click_button 'Update Post'

#     expect(page).to have_content('New Title')
#   end

#   scenario 'edit with incorrect data' do
#     within(".index-buttons") do
#       click_link 'Edit'
#     end

#     fill_in 'Title', with: ''
#     fill_in 'Body', with: ''

#     click_button 'Update Post'

#     expect(page).to have_content('Please review the problems below')
#   end
# end
