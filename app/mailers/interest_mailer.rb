class InterestMailer < ApplicationMailer

	@volunteer = nil
	@opportunity = nil
	@ngo = nil

	def volunteeremail(volunteer, opportunity)
		@volunteer = volunteer
		@opportunity = opportunity
		mail(to: @volunteer.email, subject: 'Confirmamos seu interesse na vaga #{@opportunity.title}')
		ngoemail()
	end

	def ngoemail()
		@ngo = @opportunity.ngo
		mail(to: @ngo.email, subject: 'Um voluntário se interessou por sua vaga: #{@opportunity.title}')
	end
end
