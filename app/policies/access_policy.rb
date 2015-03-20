class AccessPolicy
  attr_reader :owner, :requestor

  def initialize(owner, requestor)
    @owner, @requestor = owner, requestor
  end

  def allowed?
    owner == requestor
  end
end
