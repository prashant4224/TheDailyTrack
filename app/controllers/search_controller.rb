class SearchController < ApplicationController

	def search
	  if params[:q].nil?
	    @tickets = []
	  else
	    @tickets = Ticket.search params[:q]
	  end
	end

end
