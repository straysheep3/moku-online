class Room < ActiveRecord::Base
  belongs_to :user
  has_many :chats, dependent: :destroy
  has_many :tasks
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
