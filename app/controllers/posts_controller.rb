class PostsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  expose(:post, attributes: :post_params)
  expose(:posts) { Post.includes(:user, comments: :user).order('created_at desc').page params[:page] }
  expose(:comments) { post.comments.order('created_at desc').page params[:page] }

  def create
    flash[:notice] = 'Post was successfully created.' if post.save
    respond_with(post)
  end

  def update
    flash[:notice] = 'Post was successfully updated.' if post.save && post.editable?
    respond_with(post)
  end

  def destroy
    post.destroy
    respond_with(post)
  end

  private

  def self.editable?
    post.user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :body, :picture, :published).merge(user: current_user)
  end
end
