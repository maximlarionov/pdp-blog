class CommentsController < ApplicationController
  respond_to :html

  expose(:comment, attributes: :comment_params)
  expose(:comments) { Comment.page(params[:page]) }

  def create
    flash[:notice] = 'Comment was successfully created.' if comment.save
    respond_with(comment)
  end

  def update
    flash[:notice] = 'Comment was successfully updated.' if comment.save
    respond_with(comment)
  end

  def destroy
    comment.destroy
    respond_with(comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
