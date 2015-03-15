require 'rails_helper'

describe CommentsController do

  context 'when unauhorized user' do
    describe '#create' do
      context 'with valid params' do
        let(:article) { create(:post) }

        subject { post :create, comment: { message: 'text' }, post_id: article.id, format: :html }

        it "doesn't create new comment" do
          expect { subject }.not_to change { Comment.count }
        end

        it { is_expected.to redirect_to(new_user_session_path) }
      end
    end
  end

  context 'when authorized user' do
    let(:user) { create(:user, confirmed_at: DateTime.now) }
    let(:article) { create(:post, user: user) }
    let(:params) { { comment: { message: 'text' }, post_id: article.id, format: :html } }

    before { sign_in(user) }
    subject { response }

    describe '#create' do
      def do_create
        post :create, params
      end

      context 'with valid params' do
        subject { do_create }

        it 'creates new Comment' do
          expect { subject }.to change { Comment.count }.by(1)
        end

        it { expect(response.status).to eq(200) }
      end

      context 'with invalid params' do
        before do
          request.env['HTTP_REFERER'] = "http://test.host/posts/#{article.id}/comments"
        end

        subject { post :create, comment: { message: '' }, post_id: article.id }

        it 'does NOT create new comment' do
          expect { subject }.not_to change { Comment.count }
        end

        it { is_expected.to redirect_to(:back) }
      end
    end
  end
end
