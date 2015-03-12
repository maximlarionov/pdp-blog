require 'rails_helper'

feature 'Add Post' do
  let(:user) { create(:user, :confirmed) }

  before do
    login_as user

    visit posts_path
    click_link 'New Post'
  end

  scenario 'I see posts#new page' do
    expect(current_path).to eq new_post_path
    expect(page).to have_css('input#post_title')
    expect(page).to have_css('textarea#post_body')
  end

  scenario 'I submit post with valid data' do
    fill_in 'Title', with: 'Title'
    fill_in 'Body', with: 'Text'

    click_button 'Create Post'

    expect(current_path).to eq post_comments_path(Post.first.id)
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Text'
  end

  scenario 'I submit post with invalid data' do
    click_button 'Create Post'

    expect(page).to have_css '.alert-box'
    expect(page).to have_css '.error'

    within('.alert-box') do
      expect(page).to have_content "Please review the problems below"
    end

    within('.post_title') do
      expect(page).to have_content "can't be blank"
    end

    within('.post_body') do
      expect(page).to have_content "can't be blank"
    end
  end
end
