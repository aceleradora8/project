class InterestsController < ApplicationController

	def new
		@volunteer = Volunteer.new()
	end

end
