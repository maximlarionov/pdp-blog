class PostsController < ApplicationController
  respond_to :html

  expose(:post, attributes: :post_params)
  expose(:comments)
  expose(:comment, attributes: :comment_params)

  expose(:user_posts) { current_user.posts.page params[:page] }
  expose(:all_posts) { Post.all.with_user.page params[:page] }

  expose(:post_presenter) { PostPresenter.wrap(post) }
  expose(:posts_presenter) { PostPresenter.wrap(user_posts) }
  expose(:feed_presenter) { PostPresenter.wrap(all_posts) }

  before_action :authorize_user?, only: %i(update, destroy)

  def index
  end

  def feed
  end

  def create
    post.save
    respond_with post
  end

  def update
    post.save
    respond_with post
  end

  def destroy
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :picture, :published).merge(user: current_user)
  end

  def comment_params
    params.require(:comment).permit(:user_id, :message, :post_id).merge(user: current_user, post: post)
  end


  def authorize_user?
    fail NotAuthorizedError unless AccessPolicy.new(post, current_user).can_manage?
  end
end
