class Plan < ActiveRecord::Base
  
	# Associations
	has_many :phases, dependent: :destroy
  belongs_to :team
end
