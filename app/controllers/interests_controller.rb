class InterestsController < ApplicationController  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

	def new
		@volunteer = Volunteer.new()
	end

end