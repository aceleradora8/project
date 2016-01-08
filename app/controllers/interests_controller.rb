class InterestsController < ApplicationController
  before_action :require_user, only: [:create]

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
    interest = Interest.find_by(opportunity_id:params[:id], volunteer_id: current_user.volunteer.id)
 		interest.destroy
    VolunteerMailer.cancel_interest_email_volunteer(current_user.volunteer, interest.opportunity).deliver_later
    NgoMailer.cancel_interest_email_ngo(current_user.volunteer, interest.opportunity).deliver_later
 		redirect_to interest.opportunity, notice: 'Interesse desmarcado com sucesso'
  end

  def my_interests
    @user = current_user
    @volunteer = Volunteer.find_by_user_id(@user.id)
  end

  private

  def interest_params
    params.require(:interest).permit(:opportunity_id, volunteer_attributes: [:name, :email, :phone, :observations])
  end
end
