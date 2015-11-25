class NgoMailer < ApplicationMailer

	default from: 'centrodeinovacaodememes@gmail.com'

	def ngo_email(volunteer, opportunity)
		@volunteer = volunteer
		@opportunity = opportunity
		@ngo = @opportunity.ngo
		mail(to: @ngo.email, 
			subject: "Recebemos interesse na sua vaga: #{@opportunity.title}", 
			content_type: "text/html")
	end
end
