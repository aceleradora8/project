class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	add_flash_types :error
	helper_method :current_user
	helper_method :ngo_owner_of_opportunity
	helper_method :require_user_owner_ngo
	helper_method :volunteer_is_interested

	def current_user
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
		if !current_user.nil?
			redirect_to '/' unless !current_user.nil? && (current_user.ngo.id == opportunity.ngo.id)
		end
	end

	def require_user_owner_ngo(ngo)
		return true if current_user.ngo.id == ngo.id
	end

	def ngo_owner_of_opportunity(opportunity)
		return true if !current_user.nil? && current_user.ngo? && current_user.ngo.id == opportunity.ngo.id
	end

	def volunteer_is_interested(opportunity)
			return current_user.volunteer.interests.any? do |interest|
				interest.opportunity_id == opportunity.id
			end if !current_user.nil? && current_user.volunteer?
	end
end
