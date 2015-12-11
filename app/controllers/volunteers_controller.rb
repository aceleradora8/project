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
    @volunteer.user.role = "volunteer"
    respond_to do |format|
      if email_exists?(@volunteer)
        format.html {render :new, error: "O email informado já está cadastrado"}
      elsif @volunteer.save
        UserMailer.email_confirmation(@volunteer).deliver
        format.html {redirect_to '/login', notice: "Voluntário cadastrado com sucesso, confirme o email para continuar"}
      else
        render 'new'
      end
    end
  end

  private
    def volunteer_params
      params.require(:volunteer).permit(:user_id, :name, :observations, :phone, :phone1, :phone2, :user_attributes => [:email, :password, :password_confirmation])
    end

    def email_exists?(volunteer)
      if User.find_by_email(volunteer.user.email) != nil
        return true
      end

    end

end
