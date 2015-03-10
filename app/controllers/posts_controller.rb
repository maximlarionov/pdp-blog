class PostsController < ApplicationController
  respond_to :html

  expose(:post, attributes: :post_params)
  expose(:posts) { Post.ordered.with_user.page params[:page] }

  expose(:post_presenter) { post.decorate }
  expose(:posts_presenter) { posts.decorate }

  def create
    if post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to post_comments_path(post)
    else
      respond_with post
    end
  end

  def update
    if post.save && post.user == current_user
      flash[:success] = 'Post was successfully updated.'
    else
      flash[:alert] = "Post wasn't successfully updated."
    end
    redirect_to :back
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
end
