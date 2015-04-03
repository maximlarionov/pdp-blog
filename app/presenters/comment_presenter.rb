class CommentPresenter < BasePresenter
  attr_reader :comment
  delegate :id, :message, :created_at, :user, :post, to: :comment
  delegate :to_key, :to_param, :persisted?, :to_partial_path, to: :comment

  def initialize(comment)
    @comment = comment
  end

  def time
    created_at.strftime('%d %b at %I:%M %p')
  end

  def author
    user.to_s.titleize
  end

  def can_be_accessed_by?(requestor)
    AccessPolicy.new(comment, requestor).can_manage?
  end

  def self.model_name
    Comment.model_name
  end
end
