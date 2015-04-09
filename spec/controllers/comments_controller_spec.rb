require 'rails_helper'

describe CommentsController, js: true do
  context 'when unauhorized user' do
    describe '#create' do
      context 'with valid params' do
        let(:article) { create(:post) }

        subject { post :create, comment: { message: 'text' }, post_id: article.id, format: :js }

        it "doesn't create new comment" do
          expect { subject }.not_to change { Comment.count }
        end

        its(:status) { is_expected.to eq 401 }
      end
    end
  end

  context 'when authorized user' do
    let(:user) { create(:user, confirmed_at: DateTime.now) }
    let(:article) { create(:post, user: user) }
    let(:params) { { comment: { message: 'text' }, post_id: article.id, format: :js } }

    before { sign_in(user) }
    subject { response }

    describe '.create' do
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
        let(:params) { { comment: { message: '' }, post_id: article.id, format: :js } }

        subject { do_create }

        it 'does NOT create new comment' do
          expect { do_create }.not_to change { Comment.count }
        end
      end
    end
  end
end
