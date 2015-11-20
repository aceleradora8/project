class VolunteersController < ApplicationController
	def index
		@volunteer = Volunteer.all
	end
end
