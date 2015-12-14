class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :error
  helper_method :current_user
  helper_method :ngo_owner_of_opportunity

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

  def require_ngo_owner_opportunity(opportunity)
    redirect_to '/' unless current_user.ngo.id == opportunity.ngo.id
  end

  def ngo_owner_of_opportunity(opportunity)
    if current_user.ngo.id == opportunity.ngo.id
      return true
    else
      return false
    end
  end


  def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get? 
    if (request.path != "/login" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end
end
