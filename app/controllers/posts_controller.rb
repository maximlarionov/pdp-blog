class PostsController < ApplicationController
  helper ApplicationHelper

  respond_to :html

  before_action :authorize_user, only: %i(update destroy)

  expose(:post, attributes: :post_params)
  expose(:user_posts) { current_user.posts.page params[:page] }
  expose(:all_posts) { Post.all.with_user.page params[:page] }

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
    if post.save
      flash[:success] = 'Post was successfully updated.'
    else
      flash[:alert] = "Post wasn't successfully updated."
    end
    redirect_to :back
    # post.save
    # render 'posts/_form', post: post
  end

  def destroy
    post.destroy
    flash[:success] = 'Post was successfully destroyed.'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :picture, :published).merge(user: current_user)
  end

  def authorize_user
    AccessPolicy.new(post, current_user).can_access_post?
  end
end
