require 'rails_helper'

feature 'See Post' do
  let(:post) { create(:post) }

  before do
    visit post_path(post)
  end

  scenario 'I do not have access posts#show page' do
    expect(current_path).to eq new_user_session_path
  end
end
