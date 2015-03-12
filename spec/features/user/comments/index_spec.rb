require 'rails_helper'

feature 'Add comment to existing post' do
  let(:user) { create(:user, :confirmed) }
  let!(:post) { create(:post, user: user, title: "My Post") }

  before do
    login_as user

    visit posts_path
  end

  scenario 'I see "create comment" sidebar' do
    within('.comments-index') do
      expect(page).to have_content('Comments')
      expect(page).to have_content('Create Comment')
    end
  end
end
