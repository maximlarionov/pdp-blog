require 'rails_helper'

feature 'See Posts' do
  before do
    visit posts_path
  end

  scenario 'I do not have access posts#index page' do
    expect(current_path).to eq new_user_session_path
  end
end
