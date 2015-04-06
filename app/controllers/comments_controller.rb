class CommentsController < ApplicationController
  respond_to :html, :js

  expose(:comment, attributes: :comment_params)
  expose(:post)

  def index
  end

  def create
    if comment.save
      status = :ok
      render partial: 'discussion', post: post, layout: false
    else
      status = :unprocessable_entity
      render partial: 'comments/form', layout: false, status: status, locals: { comment: comment }
    end

  end

  def destroy
    comment.destroy if authorize_user?
    render inline: 'location.reload();'
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :message, :post_id).merge(user: current_user, post: post)
  end

  def authorize_user?
    AccessPolicy.new(post, current_user).can_manage?
  end
end
