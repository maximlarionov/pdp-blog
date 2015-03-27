require 'rails_helper'

describe PostPresenter do
  let(:user) { create(:user, full_name: 'Obi Van Kenobi') }
  let(:post) { create(:post, user: user) }
  let(:presenter) { PostPresenter.wrap(post) }

  context 'when wrapping post' do
    before do
      post.created_at = 2.days.ago
      post.updated_at = post.created_at
    end

    subject { presenter }

    its(:author) { is_expected.to be post.user.full_name }
    its(:created) { is_expected.to be == post.created_at.strftime('%d %b at %I:%M %p') }
    its(:updated) { is_expected.to be == post.updated_at.strftime('%d %b at %I:%M %p') }
  end
end
