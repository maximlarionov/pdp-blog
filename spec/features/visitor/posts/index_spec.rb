require 'rails_helper'

feature 'See Posts' do
  let(:user) { create(:user, :confirmed) }
  let(:another_user) { create(:user, :confirmed) }

  let!(:post) { create(:post, user: user, title: 'My Post') }
  let!(:my_private_post) { create(:private_post, user: user, title: 'Others do NOT see') }
  let!(:another_private_post) { create(:private_post, user: another_user, title: 'U do NOT see') }

  before do
    visit posts_path
  end

  scenario 'I see posts#index page' do
    expect(current_path).to eq posts_path
    expect(page).to have_content('My Post')
  end

  scenario 'And I do NOT see users private posts' do
    expect(page).not_to have_content('U do NOT see')
    expect(page).not_to have_content('Others do NOT see')
  end

  scenario 'And I do NOT see edit/delete buttons' do
    within("#post_#{post.id}") do
      within('.button-group') do
        expect(page).not_to have_content('Edit')
        expect(page).not_to have_content('Destroy')
      end
    end
  end

  describe '.pagination' do
    context 'when there are more than 3 posts' do
      let!(:posts) { create_list(:post, 4, user: user) }

      scenario 'I can see pagination' do
        visit posts_path

        within('.paginator') do
          expect(page).to have_css('.pagination')
        end
      end
    end

    context 'when there are 3 or less posts' do
      scenario 'I do NOT see pagination' do
        within('.paginator') do
          expect(page).not_to have_css('.pagination')
        end
      end
    end
  end
end
