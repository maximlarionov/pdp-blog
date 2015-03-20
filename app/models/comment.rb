class Comment < ActiveRecord::Base
  validates :message, :user, :post, presence: true

  belongs_to :post
  belongs_to :user

  scope :recent, -> { limit(4) }
  default_scope { order('created_at desc') }
end
