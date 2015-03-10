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
    comments.recent.includes(:user).decorate
  end
end
