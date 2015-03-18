class CommentsController < ApplicationController
  respond_to :html

  expose(:post)
  expose(:comment, attributes: :comment_params)

  def index
  end

  def create
    if comment.save
      flash[:success] = 'Comment was successfully created.'
      do_respond
    else
      flash[:alert] = "Comment wasn't successfully created."
      do_respond
    end
  end

  def destroy
    comment.destroy
    do_respond
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :message, :post_id).merge(user_id: current_user.id, post_id: post.id)
  end

  def do_respond
    respond_to do |format|
      format.html { redirect_to post_path(post) }
      format.js { render inline: 'location.reload();' }
    end
  end
end
