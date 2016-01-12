class UserMailer < ApplicationMailer
  default from: ENV['USER_NAME_GMAIL']

  def email_confirmation(user)
    @user = user
    mail(to: @user.user.email,
      subject: "Confirme seu cadastro.",
      content_type: "text/html")
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Recuperação de Senha - ONGARIUM"
  end
end
