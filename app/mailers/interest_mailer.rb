class InterestMailer < ApplicationMailer

	default from: 'centrodeinovacaodememes@gmail.com'

	def interest_email(volunteer, opportunity)
		@volunteer = volunteer
		@opportunity = opportunity
		mail(to: @volunteer.email, subject: "Confirmamos seu interesse na vaga #{@volunteer.name}")
	end
end
