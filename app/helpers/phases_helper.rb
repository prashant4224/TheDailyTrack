module PhasesHelper

	def phase_name(phase)
		link_to phase.try(:name), phase
	end

end
