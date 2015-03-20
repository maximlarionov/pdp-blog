module ApplicationHelper
  def policy(object, requestor)
    AccessPolicy.new(object.user, requestor)
  end
end
