class VolunteerMailer < ApplicationMailer

	default from: 'centrodeinovacaodememes@gmail.com'

	def volunteer_email(volunteer, opportunity)
		@volunteer = volunteer
		@opportunity = opportunity
		mail(
			to: @volunteer.email, 
			subject: "Confirmamos seu interesse na vaga #{@volunteer.name}",
			content_type: "text/html"
			)

	end
end
