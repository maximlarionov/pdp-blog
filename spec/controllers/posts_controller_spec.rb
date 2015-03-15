require "rails_helper"

describe PostsController do

  context 'when user is not authenticated' do
    describe '#index' do
      before { get :index }

      its(:response) { is_expected.to be_success }
    end

    describe '#create' do
      context 'with valid params' do
        before { post :create }

        its(:status) { is_expected.to eq(302) }
        it { is_expected.to redirect_to(new_user_session_path) }
      end
    end

    describe '#update' do
      let!(:post) { create(:post) }

      before { patch :update, id: post.id }

      its(:status) { is_expected.to eq(302) }
      it { is_expected.to redirect_to(new_user_session_path) }
    end

    describe '#delete' do
      let!(:post) { create(:post) }

      before { delete :destroy, id: post }

      its(:status) { is_expected.to eq(302) }
      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  context 'when authorized user' do
    let(:user) { create(:user, confirmed_at: DateTime.now) }
    let(:params) { { post: { title: 'title', body: 'text' }, format: :html } }

    before { sign_in(user) }
    subject { response }

    describe '#index' do
      before { get :index }

      it { is_expected.to be_success }
    end

    describe '#create' do
      def do_create
        post :create, params
      end

      context 'with valid params' do
        subject { do_create }

        it 'creates new post' do
          expect { subject }.to change { Post.count }.by(1)
        end

        it { expect(response.status).to eq(200) }
      end

      context 'with invalid params' do
        subject { post :create, post: { title: '', body: '' } }

        it 'creates new post' do
          expect { subject }.not_to change { Post.count }
        end

        it { is_expected.to render_template(:new) }
      end
    end

    describe '#update' do
      let!(:post) { create(:post, user: user) }
      let(:new_params) { { title: 'Amazing' } }

      def do_update
        patch :update, id: post.id, post: new_params, format: :html
      end

      subject { response }
      before do
        request.env['HTTP_REFERER'] = 'http://localhost:5000/sessions/new'
        do_update
     end

      context 'with valid params' do
        it { is_expected.to redirect_to(:back) }
        it { expect(post.reload.title).to eq('Amazing') }
      end

      context 'with invalid params' do
        let(:new_params) { { title: 'Amazing', body: nil } }

        it { is_expected.to redirect_to(:back) }
        it { expect(post.reload.title).to eq('MyString') }
      end
    end

    describe '#destroy' do
      let!(:post) { create(:post) }

      it "deletes the post" do
        expect { delete :destroy, id: post }.to change(Post, :count).by(-1)
      end
    end
  end
end
