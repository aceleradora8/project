class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update]
  def new
    @volunteer = Volunteer.new
    @volunteer.build_user
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @volunteer.update(volunteer_params)
      redirect_to @volunteer, notice: "Voluntário atualizado com sucesso!"
    else
      render 'edit'
    end
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.user.role = "volunteer"
    if @volunteer.user.user_exists?
      redirect_to new_volunteer_url, error: "O email informado já está cadastrado"
    elsif @volunteer.save
      UserMailer.email_confirmation(@volunteer).deliver
      redirect_to login_url, notice: "Voluntário cadastrado com sucesso, confirme o email para continuar!"
    else
      render 'new'
    end
  end

  def destroy
    @volunteer = Volunteer.find_by_id(params[:id])
    cookies.delete(:auth_token)
    @volunteer.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Voluntário deletado com sucesso!" }
    end
  end

  def set_volunteer
    if Volunteer.where(id: params[:id]).present?
      @volunteer = Volunteer.find(params[:id])
    else
      redirect_to "/404"
    end
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name, :observations, :phone1, :phone2, user_attributes: [:email, :password, :password_confirmation])
  end
end
