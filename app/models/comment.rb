class Comment < ActiveRecord::Base
  validates :message, presence: true

  belongs_to :post
  belongs_to :user

  scope :recent, -> { limit(4) }

  # paginates_per 4

  def time
    self.created_at = created_at.strftime("%I:%M %p | %b %d, %Y")
  end
end
