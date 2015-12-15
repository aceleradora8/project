class InterestsController < ApplicationController  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :require_user, only: [:new, :create]

	def new
		@interest = Interest.new
		@user = current_user
		@volunteer = @user.volunteer
	end

	def create
		@interest = Interest.new(interest_params)
		@interest.volunteer = current_user.volunteer
		respond_to do |format|
			if @interest.save
				VolunteerMailer.volunteer_email(@interest.volunteer, @interest.opportunity).deliver_later
				NgoMailer.ngo_email(@interest.volunteer, @interest.opportunity).deliver_later
				format.html { redirect_to @interest.opportunity, notice: 'Interesse registrado com sucesso' }
			else
				format.html { render :new }
			end
		end
	end

	def show
		@interest = Interest.find_by_id(params[:id])
	end

	def destroy
		@interest = Interest.find_by_id(params[:id])
		@interest.destroy
		redirect_to '/'
	end

	def my_interests
	    @user = current_user
	    @volunteer = Volunteer.find_by_user_id(@user.id)
  	end

  	def decline_interest
  		@interest = Interest.find_by_id(params[:id])
  	end

  	def send_email
  	end
  	
	private
	    def interest_params
	    	params.require(:interest).permit(:opportunity_id, :volunteer_attributes => [:name, :email, :phone, :observations])
	    end
end