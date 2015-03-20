class PostsController < ApplicationController
  respond_to :html

  expose(:post, attributes: :post_params)
  expose(:user_posts) { Post.all.with_user.page params[:page]  }

  expose(:post_presenter) { PostPresenter.wrap(post) }
  expose(:posts_presenter) { PostPresenter.wrap(user_posts) }

  def index
  end

  def create
    if post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to post_path(post)
    else
      respond_with post
    end
  end

  def update
    if post.save
      flash[:success] = 'Post was successfully updated.'
    else
      flash[:alert] = "Post wasn't successfully updated."
    end
    redirect_to :back
  end

  def destroy
    post.destroy!
    flash[:success] = 'Post was successfully destroyed.'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :picture, :published).merge(user: current_user)
  end
end
