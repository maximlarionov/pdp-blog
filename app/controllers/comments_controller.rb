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
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js { render inline: 'location.reload();' }
    end
  end

  def destroy
    comment.destroy
    respond_to do |format|
      format.html { redirect_to post_comments_path(post) }
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :message, :post_id).merge(user_id: current_user.id, post_id: post.id)
  end
end
