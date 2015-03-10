class Post < ActiveRecord::Base
  validates :title, :body, :user, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :picture,
                    styles: {
                      medium: '600x500>',
                      thumb: '100x100>'
                    },
                    default_url: '/images/:style/missing.png',
                    dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                    dropbox_visibility: 'public'

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  paginates_per 3

  scope :ordered, -> { order('created_at desc') }
  scope :with_user, -> { includes(:user) }
end
