class Objective < ActiveRecord::Base
  
  # Associations
	has_many :comments, dependent: :destroy
	has_many :photos, as: :photo_holder, dependent: :destroy
	has_many :posts #, as: :postable, dependent: :destroy
  belongs_to :phase, counter_cache: true
  has_many :tickets, dependent: :destroy

  def self.for_select
  	Team.all.map do |team|
  		team.plans.each do |plan|
  			plan.phases.each do |phase|
  			  [team.name, plan.name, phase.name, phase.objectives.map { |c| [c.name, c.id] }]
	    	end
	    end
	  end
  end

end
