require 'rails_helper'

feature 'See Posts' do
  let(:user) { create(:user, :confirmed) }
  let(:another_user) { create(:user, :confirmed) }

  let!(:post) { create(:post, user: user, title: 'My Post') }
  let!(:my_private_post) { create(:private_post, user: user, title: 'Others do NOT see') }
  let!(:another_private_post) { create(:private_post, user: another_user, title: 'U do NOT see') }

  before do
    login_as user

    visit posts_path
  end

  scenario 'I see posts#index page' do
    expect(current_path).to eq posts_path
    expect(page).to have_content('My Post')
  end

  scenario 'And I do NOT see other users private posts' do
    expect(page).not_to have_content('U do NOT see')
  end

  scenario 'And I can see my private posts' do
    expect(page).to have_content('Others do NOT see')
  end
end
