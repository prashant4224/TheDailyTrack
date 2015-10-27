module TeamsHelper

	def team_name(team)
		link_to team.try(:name), team
	end

end
