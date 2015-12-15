class SessionsController < ApplicationController

  def new
    session[:return_to] ||= request.referer
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user == nil
      redirect_to login_url, :error => "Email não existe, por favor, cadastre-se"
    elsif @user && @user.authenticate(params[:session][:password]) && @user.confirmed == true
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      redirect_to session.delete(:return_to), :notice => "Login realizado com sucesso!"
    elsif @user.confirmed == false
      redirect_to login_url, :error => "Sua conta não foi ativada. Cheque seu email!"
    else
      redirect_to login_url, :error => "Email ou senha inválidos!"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Você finalizou a sua sessão!"
  end
end

