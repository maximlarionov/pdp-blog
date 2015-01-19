class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, :body, presence: true
  # mount_uploader :picture, PictureUploader
  # paginates_per 3

  def was_updated?
    created_at != updated_at
  end

  def is_author?
    post.user_id == current_user.id
  end

   def created
     created_at.strftime("%I:%M %p | %b %d, %Y")
   end

   def updated
    updated_at.strftime("%I:%M %p | %b %d, %Y")
   end
end
