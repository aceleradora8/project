class InterestsController < ApplicationController  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

	def new
	end

	def create
		@interest = Interest.new(interest_params)
		if @interest.save
			@volunteer = Volunteer.find(@interest.volunteer_id)
			@opportunity = Opportunity.find(@opportunity_id)
			InterestMailer.interest_email(@volunteer, @opportunity).deliver_later
			NgoMailer.ngo_email(@volunteer, @opportunity).deliver_later
		else
			puts 'Erro'
		end
	end

private
	def interest_params
		params.require(:interest).permit(:volunteer_id, :opportunity_id, :confirmed, :presence)
	end

end