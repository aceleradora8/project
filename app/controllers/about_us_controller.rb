class AboutUsController < ApplicationController

def index
end

def contact
  respond_to do |format|
    ContactUsMailer.contact_us(params[:type], params[:name], params[:email], params[:phone], params[:message]).deliver_later
    format.html { redirect_to '/about_us', notice: "Mensagem entregue, obrigado por entrar em contato conosco!"}
  end
end

end
