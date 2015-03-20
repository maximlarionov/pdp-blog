class PostPresenter < BasePresenter
  attr_reader :post
  delegate :id, :title, :body, :picture, :published?, :user, :comments, :created_at, :updated_at, to: :post

  def initialize(post)
    @post = post
  end

  def was_updated?
    created_at != updated_at
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

  def can_be_edited_by?(current_user)
    user == current_user
  end

  def clear
    post
  end
end
