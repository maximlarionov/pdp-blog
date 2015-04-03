class PostsController < ApplicationController
  respond_to :html
  respond_to :js, only: :update

  expose(:post, attributes: :post_params)
  expose(:user_posts) { current_user.posts.page params[:page] }
  expose(:all_posts) { Post.all.with_user.page params[:page] }
  expose(:comment) { post.comments.new }

  expose(:post_presenter) { PostPresenter.wrap(post) }
  expose(:posts_presenter) { PostPresenter.wrap(user_posts) }
  expose(:feed_presenter) { PostPresenter.wrap(all_posts) }

  def index
  end

  def feed
  end

  def create
    post.save
    respond_with post
  end

  def update
    post.save if authorize_user?
    respond_with post
  end

  def destroy
    post.destroy if authorize_user?
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :picture, :published).merge(user: current_user)
  end

  def authorize_user?
    AccessPolicy.new(post, current_user).can_manage?
  end
end
