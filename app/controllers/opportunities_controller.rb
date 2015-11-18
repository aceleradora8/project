class OpportunitiesController < ApplicationController

	def index
		if params[:text_search] == nil || params[:text_search] == ""
			@OpportunitySearch = Opportunity.all
		else
			@OpportunitySearch = Opportunity.search("#{params[:text_search] }").to_a
		end
	end

end
