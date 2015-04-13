class CommentsController < ApplicationController
  respond_to :html
  respond_to :js, only: :create

  expose(:post)
  expose(:comments)
  expose(:comment, attributes: :comment_params)

  before_action :authorize_user?, only: :destroy

  def index
  end

  def create
    comment.save
    respond_with comment
  end

  def destroy
    comment.destroy
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :message, :post_id).merge(user: current_user, post: post)
  end

  def authorize_user?
    fail NotAuthorizedError unless AccessPolicy.new(comment, current_user).can_manage?
  end
end
