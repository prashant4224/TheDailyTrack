class Objective < ActiveRecord::Base
  
  # Associations
	has_many :comments, dependent: :destroy
	has_many :images, dependent: :destroy
	has_many :posts, as: :postable, dependent: :destroy
  belongs_to :phase

end
