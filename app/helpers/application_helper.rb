module ApplicationHelper
  def policy(object, requestor)
    AccessPolicy.new(object, requestor)
  end
end
