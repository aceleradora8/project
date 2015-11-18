class OpportunitiesController < ApplicationController

	def index
		text_search = params[:text_search] if params[:text_search] != nil
		@OpportunitySearch = Opportunity.search("#{text_search}").to_a
	end

end
