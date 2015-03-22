require 'rails_helper'

feature 'See Posts' do
  let(:user) { create(:user, :confirmed) }
  let(:another_user) { create(:user, :confirmed) }

  let!(:post) { create(:post, user: user, title: 'User Post') }
  let!(:my_private_post) { create(:private_post, user: user, title: 'Others do NOT see') }
  let!(:another_post) { create(:post, user: another_user, title: 'Another User Post') }
  let!(:another_private_post) { create(:private_post, user: another_user, title: 'U do NOT see') }

  before do
    login_as user

    visit feed_path
  end

  scenario 'I do have access to posts#feed page' do
    expect(current_path).to eq feed_path
    expect(page).to have_content('User Post')
    expect(page).to have_content('Another User Post')
  end

  scenario 'And I see my private posts' do
    expect(page).to have_content('Others do NOT see')
  end

  scenario 'And I do NOT see users private posts' do
    expect(page).not_to have_content('U do NOT see')
  end

  context 'when accessing another_user post' do
    scenario 'I do not see edit and destroy button' do
      within("#post_#{another_post.id}") do
        within('.button-group') do
          expect(page).not_to have_content('Edit')
          expect(page).not_to have_content('Destroy')
        end
      end
    end

    scenario 'I see To Comments button' do
      within("#post_#{another_post.id}") do
        within('.button-group') do
          expect(page).to have_content('To Comments')
        end
      end
    end
  end
end
