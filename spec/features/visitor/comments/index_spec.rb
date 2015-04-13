require 'rails_helper'

feature 'See Comments' do
  let(:post) { create(:post) }
  let(:comment) { create(:comment, post: post, message: "Hello there!")}

  before do
    visit feed_path
  end

  scenario 'I see comments on posts#feed page' do
    expect(page).to have_content("Hello there!")
  end
end
