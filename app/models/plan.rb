class Plan < ActiveRecord::Base
  
	# Associations
	has_many :phases, dependent: :destroy, after_add: [ lambda { |a, c| a.__elasticsearch__.index_document }],
											after_remove: [ lambda { |a, c| a.__elasticsearch__.index_document }]
  belongs_to :team#, counter_cache: true

  def self.for_select
  	Plan.all.map do |plan|
      [plan.name, plan.phases.map { |c| [c.name, c.id] }]
    end
  end

end
