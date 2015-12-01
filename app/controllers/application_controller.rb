class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :error

  helper_method :current_user

  def current_user
  	#@current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def require_user
  	redirect_to login_path unless current_user
  end
  
  def require_ngo
    redirect_to '/' unless current_user.ngo?
  end

  def require_volunteer
    redirect_to '/' unless current_user.volunteer?
  end

  def require_admin
    redirect_to '/' unless current_user.admin?
  end

end
