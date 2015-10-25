class Phase < ActiveRecord::Base

	# Associations
	has_many :objectives, dependent: :destroy
  belongs_to :plan, counter_cache: true

  def self.for_select
  	Phase.all.map do |phase|
      [phase.name, phase.objectives.map { |c| [c.name, c.id] }]
    end
  end
end
