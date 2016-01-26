class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update]
  before_action :user_not_registered, only: [:new]
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
      redirect_to @volunteer, notice: "Informações atualizadas com sucesso!"
    else
      render 'edit'
    end
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.user.role = "volunteer"
    if @volunteer.user.user_exists?
      redirect_to new_volunteer_url, error: "O e-mail informado já está cadastrado!"
    elsif @volunteer.save
      UserMailer.email_confirmation(@volunteer).deliver_later
      redirect_to login_url, notice: "Voluntário cadastrado com sucesso! Foi enviado um e-mail de confirmação, verifique sua caixa de entrada."
    else
      render 'new'
    end
  end

  def destroy
    @volunteer = Volunteer.find_by_id(params[:id])
    respond_to do |format|
      if @volunteer.user.authenticate(params[:password])
        cookies.delete(:auth_token)
        @volunteer.destroy
        format.html { redirect_to root_path, notice: "Voluntário deletado com sucesso!" }
      else
        format.html {redirect_to edit_user_path, error: "Senha incorreta!"}
      end
    end
  end

  def set_volunteer
    if Volunteer.where(id: params[:id]).present?
      @volunteer = Volunteer.find(params[:id])
    end
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name, :observations, :phone1, :phone2, :sex, :birth_date, user_attributes: [:photo, :email, :password, :password_confirmation])
  end
end
