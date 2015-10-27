module PlansHelper

	def plan_name(plan)
		link_to plan.try(:name), plan
	end
end
