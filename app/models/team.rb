class Team < ActiveRecord::Base
  include Searchable
  include Commentable

	# Associations
	has_many :plans, dependent: :destroy

	accepts_nested_attributes_for :plans
  before_create :create_name

	def self.for_select
  	Team.all.each do |team|
  		next if team.blank?
  		team.plans.each do |plan|
  			next if plan.blank?
  			plan.phases.each do |phase|
  				next if phase.blank?
  				#p phase.objectives
  				phase.objectives.each do |obj|
  					next if obj.blank?
  					[phase.name, [obj.name, obj.id] ]
  				end
  			  #[team.name, plan.name, phase.name, phase.objectives.map { |c| [c.name, c.id] }]
	    	end
	    end
	  end
  end

  def create_name
    self.name = "Prashant"
  end
	
end
