class Post < ActiveRecord::Base

	has_many :comments, as: :commentable
	has_many :comments, dependent: :destroy
	
	belongs_to :postable, polymorphic: true
	belongs_to :user
	belongs_to :objective

end
