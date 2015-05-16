class Phase < ActiveRecord::Base

	# Associations
	has_many :objectives, dependent: :destroy
  belongs_to :plan
end
