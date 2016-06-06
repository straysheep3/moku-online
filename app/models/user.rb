class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rooms

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "25x25>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
