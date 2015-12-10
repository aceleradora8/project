class VolunteersController < ApplicationController

  def new
    @volunteer = Volunteer.new
    @volunteer.build_user
  end

  def index
    
  end

  def show
  end

  def create
    @user_email = User.find_by_email(volunteer_params[:user_attributes][:email])
    @volunteer = Volunteer.new(volunteer_params)

    if @volunteer.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  private
    def volunteer_params
      params.require(:volunteer).permit(:user_id, :name, :observations, :phone, :phone1, :phone2, :user_attributes => [:email, :password, :password_confirmation])
    end

end
