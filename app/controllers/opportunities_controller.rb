class OpportunitiesController < ApplicationController
	
	before_action :set_opportunity, only: [:show,:interest]
	before_action :set_causesandcitys

	def index
		if params[:text_search] == nil || params[:text_search] == ""
			@opportunity_search = Opportunity.all.includes(:address,:ngo,:cause).page params[:page]
		else
			@opportunity_search = Opportunity.search("#{params[:text_search] }").includes(:address,:ngo,:cause).page params[:page]
		end
	end

	def show
	end

	def filter(params, already_checked)
		if(params.keys[0] == :address && already_checked == true)
			@filtered_opportunity = @filtered_opportunity.delete_if {|x| x.address.city == params[:address]}		
		elsif(params.keys[0] == :cause && already_checked == true)
			@filtered_opportunity = @filtered_opportunity.delete_if {|x| x.cause == params[:cause]}
			
		elsif(already_checked == false)
			@filtered_opportunity = @filtered_opportunity.push(@opportunity_search.filter_by(params))
			
		end
	end

	def interest
		@volunteer = Volunteer.new(params[:volunteer])
	end

	def mailer
	end

	private 
		def set_opportunity
			if Opportunity.where(:id => params[:id]).present?
				@opportunity = Opportunity.find(params[:id])
			else
				redirect_to "/404"
			end
		end

		def set_causesandcitys
			@causes_all = Cause.all()
			@address_all = Address.all()
		end

end
