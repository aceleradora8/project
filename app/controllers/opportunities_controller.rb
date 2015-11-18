class OpportunitiesController < ApplicationController

	def index
		text_search = params[:text_search] if params[:text_search] != nil
		
	end

end
