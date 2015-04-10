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
    do_respond
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :message, :post_id).merge(user: current_user, post: post)
  end

  def do_respond
    respond_to do |format|
      format.html { redirect_to post_path(post) }
      format.js { render inline: 'location.reload();' }
    end
  end

  def authorize_user?
    fail NotAuthorizedError unless AccessPolicy.new(post, current_user).can_manage?
  end
end
