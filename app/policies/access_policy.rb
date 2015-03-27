class AccessPolicy
  attr_reader :item, :requestor

  def initialize(item, requestor)
    @item, @requestor = item, requestor
  end

  def can_manage?
    item.user == requestor
  end

  def can_read?
    item.published? || can_manage?
  end
end
