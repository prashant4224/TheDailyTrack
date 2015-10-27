module ObjectivesHelper

	def objective_name(objective)
		link_to objective.try(:name), objective
	end

end
