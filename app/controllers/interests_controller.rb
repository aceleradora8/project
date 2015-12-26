class InterestsController < ApplicationController
  before_action :require_user, only: [:new, :create]
  before_action :set_interest, only: [:show, :destroy]

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
  end

  def destroy
 		@interest.destroy
 		redirect_to '/'
  end

  def my_interests
    @user = current_user
    @volunteer = Volunteer.find_by_user_id(@user.id)
  end

  private

  def interest_params
    params.require(:interest).permit(:opportunity_id, volunteer_attributes: [:name, :email, :phone, :observations])
  end

  def set_interest
    @interest = Interest.find_by_id(params[:id])
  end
end
