class Comment < ActiveRecord::Base
  validates :message, :user, :post, presence: true

  belongs_to :post
  belongs_to :user

  scope :recent, -> { limit(4) }
  scope :ordered, -> { order('created_at desc') }
  scope :with_user, -> { includes(:user) }

  paginates_per 4
end
