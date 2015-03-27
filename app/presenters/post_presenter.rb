class PostPresenter < BasePresenter
  attr_reader :post
  delegate :id, :title, :body, :picture, :published, :user, :comments, :created_at, :updated_at, to: :post
  delegate :to_key, :to_param, :persisted?, to: :post

  def initialize(post)
    @post = post
  end

  def created
    created_at.strftime('%d %b at %I:%M %p')
  end

  def updated
    updated_at.strftime('%d %b at %I:%M %p')
  end

  def recent_comments
    CommentPresenter.wrap(comments.recent.includes(:user).order('created_at desc'))
  end

  def all_comments
    CommentPresenter.wrap(comments.includes(:user).order('created_at desc'))
  end

  def author
    user.full_name
  end

  def author_avatar
    user.avatar.url(:thumb)
  end

  def can_be_accessed_by?(requestor)
    AccessPolicy.new(post, requestor).can_manage?
  end

  def can_be_read_by?(requestor)
    AccessPolicy.new(post, requestor).can_read?
  end

  def self.model_name
    Post.model_name
  end
end
