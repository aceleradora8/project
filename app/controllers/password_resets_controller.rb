class PasswordResetsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset
      redirect_to login_url, notice: "Confira seu email, enviamos instruções de recuperação de senha"
    else
      redirect_to new_password_reset_path, error: "Email não cadastrado"
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: "Link de recuperação de senha expirado"
    elsif @user.update_attributes(user_params)
      redirect_to login_url, notice: "Sua senha foi alterada com sucesso!"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password)
  end
end
