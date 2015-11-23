class OpportunitiesController < ApplicationController
	before_action :set_opportunity, only: [:show,:interest]

	def index
		if params[:text_search] == nil || params[:text_search] == ""
			@opportunity_search = Opportunity.all.includes(:address,:ngo,:cause).page params[:page]
		else
			@opportunity_search = Opportunity.search("#{params[:text_search] }").includes(:address,:ngo,:cause).page params[:page]
			if @opportunity_search.empty? 
				@not_found = "Sua pesquisa não encontrou resultados"
			end
		end
	end

	def show
	end


	def interest
		@volunteer = Volunteer.new(params[:volunteer])
	end


	def mailer
	end

	private 
		def set_opportunity
			if Opportunity.where(:id => params[:id]).present?
				@Opportunity = Opportunity.find(params[:id])
			else
				redirect_to "/404"
			end
		end

end
