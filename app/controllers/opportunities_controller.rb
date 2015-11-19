class OpportunitiesController < ApplicationController

	def index
		if params[:text_search] == nil || params[:text_search] == ""
			@OpportunitySearch = Opportunity.all
		else
			@OpportunitySearch = Opportunity.search("#{params[:text_search] }").to_a
			if @OpportunitySearch.empty? 
				@not_found = "Sua pesquisa não encontrou resultados"
			end
		end
	end

end
