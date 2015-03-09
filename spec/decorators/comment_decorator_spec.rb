require 'rails_helper'

describe CommentDecorator do
  let(:user) { create(:user, full_name: 'Obi Van Kenobi') }
  let(:post) { create(:post) }
  let(:comment) { create(:comment, user: user) }
  let(:decorator) { comment.decorate }

  context 'when decorating comment' do
    before { comment.created_at = 1.day.ago }
    subject { decorator }

    its(:time) { is_expected.to be == comment.created_at.strftime('%d %b at %I:%M %p') }
    its(:author) { is_expected.to be == 'Obi Van Kenobi' }
  end
end
