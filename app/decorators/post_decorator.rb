class PostDecorator < Draper::Decorator
  delegate_all

  def was_updated?
    created_at != updated_at
  end

  def created
    created_at.strftime('%d %b at %I:%M %p')
  end

  def updated
    updated_at.strftime('%d %b at %I:%M %p')
  end

  def commentable
    comments.recent.includes(:user).order('created_at desc').decorate
  end

  def author
    user.full_name
  end

  def author_avatar
    user.avatar.url(:thumb)
  end
end
