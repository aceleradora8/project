class NgoMailer < ApplicationMailer
	default from: 'centrodeinovacaodememes@gmail.com'

	def ngo_email(volunteer, opportunity)
		@volunteer = volunteer
		@opportunity = opportunity
		@ngo = @opportunity.ngo
		mail(to: @ngo.user.email,
			subject: "Recebemos interesse na sua vaga: #{@opportunity.title}",
			content_type: "text/html")
	end

	def cancel_interest_email_ngo(volunteer, opportunity)
		@volunteer = volunteer
		@opportunity = opportunity
		@ngo = @opportunity.ngo
		mail(to: @ngo.user.email,
			subject: "Houve um cancelamento no interesse na sua vaga: #{@opportunity.title}",
			content_type: "text/html")
	end
end
