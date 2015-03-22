require 'rails_helper'

feature 'See Posts' do
  let(:user) { create(:user, :confirmed) }
  let(:another_user) { create(:user, :confirmed) }

  let!(:post) { create(:post, user: user, title: 'My Post') }
  let!(:another_post) { create(:post, user: another_user, title: 'His post') }

  before do
    login_as user

    visit posts_path
  end

  describe '.edit#index' do
    context 'when I edit my post' do
      scenario 'with correct data' do
        within("#post_#{post.id}") do
          within('.button-group') do
            click_link 'Edit'
          end

          fill_in 'Title', with: 'New Title'

          click_button 'Update Post'
        end

        expect(page).to have_content('New Title')

        within('.alert-box') do
          expect(page).to have_content('Post was successfully updated.')
        end
      end

      scenario 'with incorrect data' do
        within("#post_#{post.id}") do
          within('.button-group') do
            click_link 'Edit'
          end

          fill_in 'Title', with: ''
          fill_in 'Body', with: ''

          click_button 'Update Post'
        end

        within('.alert-box') do
          expect(page).to have_content("Post wasn't successfully updated.")
        end
      end
    end
  end
end
