require 'rails_helper'

feature 'Add comment to existing post', js: true do
  let(:user) { create(:user, :confirmed) }
  let!(:post) { create(:post, user: user, title: 'My Post') }

  before do
    login_as user

    visit posts_path
  end

  scenario 'I see "create comment" sidebar' do
    within('.comments_form') do
      expect(page).to have_content('Comments')
      expect(page).to have_content('New Comment')
    end
  end

  scenario 'I can create valid comment on index page' do
    click_button 'New Comment'

    within('.comment-area') do
      fill_in 'comment_message', with: 'Message123'
      click_button 'Create Comment'
    end

    expect(page).to have_content('Message123')
  end

  scenario 'I can not create invalid comment on index page' do
    click_button 'New Comment'

    within('.comment-area') do
      fill_in 'comment_message', with: ''
      click_button 'Create Comment'
    end

    expect(page).to have_content("can't be blank")
  end
end
