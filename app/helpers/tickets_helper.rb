module TicketsHelper

	def ticket_name(ticket)
		link_to ticket.try(:title), ticket
	end

end
