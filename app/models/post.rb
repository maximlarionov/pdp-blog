class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, :body, presence: true
  has_attached_file :picture, :styles => { :medium => "600x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  paginates_per 3

  def was_updated?
    created_at != updated_at
  end

  def is_author?
    self.user_id == current_user.id
  end

   def created
     created_at.strftime("%I:%M %p | %b %d, %Y")
   end

   def updated
    updated_at.strftime("%I:%M %p | %b %d, %Y")
   end
end