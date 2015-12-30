class VolunteerMailer < ApplicationMailer

	default from: 'centrodeinovacaodememes@gmail.com'

	def volunteer_email(volunteer, opportunity)
		@volunteer = volunteer
		@opportunity = opportunity
		mail(
			to: @volunteer.user.email, 
			subject: "Confirmamos seu interesse na vaga #{@opportunity.title}",
			content_type: "text/html"
			)

	end
end
