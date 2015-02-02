class CommentsController < ApplicationController
  respond_to :html

  expose(:post)
  expose(:comment, attributes: :comment_params)
  expose(:comments) { post.comments.order('created_at desc').page params[:page] }

  def index

  end

  def create
    comment = comments.new(comment_params)
    comment.save
    redirect_to posts_path(post)
  end

  def destroy
    comment.destroy
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :message, :post_id).merge(user_id: current_user.id, post_id: post.id)
  end
end
