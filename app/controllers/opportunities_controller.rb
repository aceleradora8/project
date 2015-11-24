class OpportunitiesController < ApplicationController
	
	before_action :set_opportunity, only: [:show,:interest]

	def index
		@causes = Cause.all

		@cities = Address.uniq.pluck(:city)

		if params[:text_search] == nil || params[:text_search] == ""
			@opportunity_search = Opportunity.all.includes(:address,:ngo,:cause).page params[:page]
		else
			@opportunity_search = Opportunity.search("#{params[:text_search] }").includes(:address,:ngo,:cause).page params[:page]
		end
	end

	def show
	end

	def filter
		if(params[:city] != nil && params[:checked] == true)
			@filtered_opportunity = @filtered_opportunity.delete_if {|opportunity| opportunity.address.city == params[:city]}		
		elsif(params[:cause] != nil && params[:checked] == true)
			@filtered_opportunity = @filtered_opportunity.delete_if {|opportunity| opportunity.cause.id == params[:cause]}
			
		elsif(params[:checked] == false)
			@filtered_opportunity = @filtered_opportunity.push(@opportunity_search.filter_by(params))

		end
		@teste = Opportunity.first
		respond_to do |format|
			format.json { render :json => @teste}
		end
	end

	def interest
		@volunteer = Volunteer.new(params[:volunteer])
	end

	def mailer
	end

	def filterbar
	end

	private 
		def set_opportunity
			if Opportunity.where(:id => params[:id]).present?
				@opportunity = Opportunity.find(params[:id])
			else
				redirect_to "/404"
			end
		end
end
