class ContactUsMailer < ApplicationMailer
  default from: ENV['USER_NAME_GMAIL']

  def contact_us(type,name, email, phone, message)
    @type = type
    @name = name
    @email = email
    @phone = phone
    @message = message
		mail(to: 'centrodeinovacaodememes@gmail.com',
			subject: "Mensagem Fale conosco do(a) #{@type} #{@name}",
			content_type: "text/html")
  end
end
