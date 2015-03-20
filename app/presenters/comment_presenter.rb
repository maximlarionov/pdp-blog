class CommentPresenter < BasePresenter
  attr_reader :comment
  delegate :id, :message, :created_at, :user, :post, to: :comment

  def initialize(comment)
    @comment = comment
  end

  def time
    created_at.strftime('%d %b at %I:%M %p')
  end

  def author
    user.to_s.titleize
  end

  def clear
    comment
  end

  def can_be_destroyed_by?(current_user)
    user == current_user
  end
end
