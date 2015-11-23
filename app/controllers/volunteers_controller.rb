class VolunteersController < ApplicationController
	def index
		@volunteer = Volunteer.all
	end

	def new
	end

	def show
		
	end

	def create
		@volunteer = Volunteer.new(volunteer_params)
		if @volunteer.save
			redirect_to @volunteer
		else
			render 'new'
		end
	end

	private
		def volunteer_params
			params.require(:volunteer).permit(:name, :email, :phone, :observations)	
		end

end

