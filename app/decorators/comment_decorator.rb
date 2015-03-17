class CommentDecorator < Draper::Decorator
  delegate_all

  def time
    created_at.strftime('%d %b at %I:%M %p')
  end

  def author
    user.to_s.titleize
  end
end
