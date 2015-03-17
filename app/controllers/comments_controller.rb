class CommentsController < ApplicationController
  respond_to :html

  expose(:post)
  expose(:comment, attributes: :comment_params)
  expose(:comments) { post.comments.ordered.with_user.page params[:page] }

  expose(:post_presenter) { post.decorate }
  expose(:comment_presenter) { comment.decorate }
  expose(:comments_presenter) { comments.decorate }

  def create
    if comment.save
      flash[:success] = 'Comment was successfully created.'
      redirect_to comments_anchor
    else
      flash[:alert] = "Comment wasn't successfully created."
      redirect_to comments_anchor
    end
  end

  def destroy
    comment.destroy
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :message, :post_id).merge(user_id: current_user.id, post_id: post.id)
  end

  def comments_anchor
    request.referer + "#post_#{post.id}"
  end
end
