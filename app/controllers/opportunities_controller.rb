class OpportunitiesController < ApplicationController
	
	before_action :set_opportunity, only: [:show,:interest]

	def index
		@causes = Cause.all
		@cities = Address.uniq.pluck(:city)

		if params[:text_search] == nil || params[:text_search] == ""
			@opportunity_search = Opportunity.all.includes(:address,:ngo,:cause)
		else
			@opportunity_search = Opportunity.search("#{params[:text_search] }").includes(:address,:ngo,:cause)
		end

		respond_to do |format|
	      	if request.xhr? 
				@opportunities_result = [];

		        params[:cause].each do |cause|
		        	@opportunities_result.push(@opportunity_search.select { |obj| obj.cause_id == cause.to_i })
		        end

		        @opportunities_result = Kaminari.paginate_array(@opportunities_result.flatten).page(params[:page])
		        
		        format.js
	      	else 
	      		@opportunities_result = Kaminari.paginate_array(@opportunity_search).page(params[:page])
	        	
	        	format.html
	    	end
    	end
	end

	def show
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
