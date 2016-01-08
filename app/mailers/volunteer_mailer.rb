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

	def cancel_interest_email_volunteer(volunteer, opportunity)
		@volunteer = volunteer
		@opportunity = opportunity
		mail(
			to: @volunteer.user.email,
			subject: "Confirmamos o cancelamento do interesse na vaga #{@opportunity.title}",
			content_type: "text/html"
		)
	end

end
