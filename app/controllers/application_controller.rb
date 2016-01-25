class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	add_flash_types :error
	helper_method :current_user
	helper_method :ngo_owner_of_opportunity
	helper_method :user_not_registered

	def current_user
		@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
	end

	def user_not_registered
		redirect_to '/' if current_user
	end

	def require_user
		redirect_to login_path unless current_user
	end

	def require_ngo
		redirect_to '/' unless current_user.ngo?
	end

	def ngo_owner_of_opportunity(opportunity)
		return true if !current_user.nil? && current_user.ngo? && current_user.ngo.id == opportunity.ngo.id
	end
end
