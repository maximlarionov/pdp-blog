require 'rails_helper'

feature 'See Posts' do
  let(:user) { create(:user, :confirmed) }
  let(:another_user) { create(:user, :confirmed) }

  let!(:post) { create(:post, user: user, title: 'My Post') }
  let!(:another_post) { create(:post, user: another_user, title: 'His post') }

  before do
    login_as user

    visit post_path(post)
  end

  describe 'post#show' do
    context 'when accessing my post' do
      scenario 'I can see my post' do
        expect(page).to have_content('My Post')
      end

      scenario 'I can manage my post' do
        within('.index-buttons') do
          expect(page).to have_content('Edit')
          expect(page).to have_content('Destroy')
        end
      end
    end

    context 'when accessing another user post' do
      before do
        visit post_path(another_post)
      end

      scenario 'I see his post' do
        expect(page).to have_content('His post')
      end

      scenario 'I do not see edit and destroy buttons' do
        within('.index-buttons') do
          expect(page).not_to have_content('Edit')
          expect(page).not_to have_content('Destroy')
        end
      end
    end

    scenario 'I do not see To Comments button' do
      expect(page).not_to have_content('To Comments')
    end
  end
end
