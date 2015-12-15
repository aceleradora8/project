class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	add_flash_types :error
	helper_method :current_user
	helper_method :ngo_owner_of_opportunity
	helper_method :require_user_owner_ngo
	helper_method :volunteer_is_interested

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
		if current_user != nil
			redirect_to '/' unless current_user.ngo.id == opportunity.ngo.id
		else
			redirect_to '/'
		end
	end

	def store_location
		@last_location ||= request.referer
		puts "LAST LOCATION: #{@last_location}"
	end

	def require_user_owner_ngo(ngo)
		if current_user.ngo.id == ngo.id
			return true
		else
			return false
		end
	end

	def ngo_owner_of_opportunity(opportunity)
		if (current_user != nil && current_user.ngo? && current_user.ngo.id == opportunity.ngo.id)
			return true
		else
			return false
		end
	end

	def volunteer_is_interested(opportunity)
		if current_user != nil && current_user.volunteer? 
			current_user.volunteer.interests.each do |interest|
				if interest.opportunity_id == opportunity.id
					return true
				else
					return false
				end
			end
		end
	end
end