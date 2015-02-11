class PostsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  expose(:post, attributes: :post_params)
  expose(:posts) { Post.includes(comments: :user).order('created_at desc').page params[:page] }
  expose(:comments) { post.comments.order('created_at desc').page params[:page] }

  def create
    flash[:notice] = 'Post was successfully created.' if post.save
    redirect_to post_comments_path(post)
  end

  def update
    flash[:notice] = 'Post was successfully updated.' if post.save && post.user == current_user
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js { render inline: 'location.reload();' }
    end
  end

  def destroy
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :picture, :published).merge(user: current_user)
  end
end
