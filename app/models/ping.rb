class Ping < ApplicationRecord
	belongs_to :user
  has_many :comments, dependent: :destroy
	validates :image, presence: true
	validates :user_id, presence: true

	has_attached_file :image, styles: { :medium => "300x300" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
