class Team < ActiveRecord::Base

	# Associations
	has_many :plans, dependent: :destroy

	accepts_nested_attributes_for :plans
	
end
