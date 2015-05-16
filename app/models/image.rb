class Image < ActiveRecord::Base
	has_many :comments, as: :commentable
	belongs_to :holder, polymorphic: true
	belongs_to :user

	scope :profile_images, -> {where("kind = ?", "Profile")}
end
