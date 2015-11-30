class UserMailer < ApplicationMailer

	default from: 'centrodeinovacaodememes@gmail.com'

	def email_confirmation(user)
		@user = user
		mail(to: @user.user.email,
			subject: "Confirme seu cadastro.",
			content_type: "text/html")
	end
end
