require 'rails_helper'

describe PostDecorator do
  let(:user) { create(:user, full_name: 'Obi Van Kenobi') }
  let(:post) { create(:post) }
  let(:decorator) { post.decorate }

  context 'when decorating post' do
    before do
      post.created_at = 2.days.ago
      post.updated_at = post.created_at
    end

    subject { decorator }

    its(:created) { is_expected.to be == post.created_at.strftime('%d %b at %I:%M %p') }
    its(:updated) { is_expected.to be == post.updated_at.strftime('%d %b at %I:%M %p') }
    its(:was_updated?)  { is_expected.to be false }
  end

  context 'when post was updated' do
    before do
      post.created_at = 2.days.ago
      post.updated_at = 1.day.ago
    end

    subject { decorator }

    its(:was_updated?)  { is_expected.to be true }
  end
end
