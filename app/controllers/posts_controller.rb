class PostsController < ApplicationController
  respond_to :html

  expose(:post, attributes: :post_params)
  expose(:posts) { Post.ordered.with_user.page params[:page] }

  expose(:post_presenter) { post.decorate }
  expose(:posts_presenter) { posts.decorate }

  def create
    flash[:notice] = 'Post was successfully created.' if post.save
    redirect_to post_comments_path(post)
  end

  def update
    flash[:notice] = 'Post was successfully updated.' if post.save && post.user == current_user
    redirect_to :back
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
