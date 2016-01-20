require 'rails_helper'

RSpec.describe AboutUsController, type: :controller do
  describe '#contact' do
    it 'send email when try contact us' do
      post :contact, {
        type: 'NGO',
        name: 'Qualquer Coisa',
        email: 'abc@abc.com',
        phone: "(51)3232-8185",
        message: "Veloso lindo!"
        }

      expect(flash[:notice]).to eq("Mensagem entregue, obrigado por entrar em contato conosco!")
    end
  end
end
