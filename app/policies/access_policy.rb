class AccessPolicy
  attr_reader :item, :requestor

  def initialize(item, requestor)
    @item, @requestor = item, requestor
  end

  def allowed?
    item.user  == requestor
  end

  def can_access_post?
    item.published? || allowed?
  end
end
