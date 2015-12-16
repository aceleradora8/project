require 'rails_helper'

describe NgosController, type: :controller do
    describe '#index' do
        before :each do
          address = Address.create!(city:"POA", zipcode: "5", address:"rua")
          user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
        	@ngo = Ngo.create!(address_id: address.id, name:"nome", description: "Qualquer coisa",user_id:user.id)
          user_new = User.new(email:"new@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
          @ngo_new = Ngo.new(address_id: address.id, name:"nome_new", description: "Qualquer coisa",user:user_new)
          @controller = NgosController.new
        end

        it 'returns true when passing a ngos existing name' do
          expect(@controller.ngo_exists?(@ngo)).to be true
        end

        it 'returns true when passing a ngos existing email' do
          expect(@controller.ngo_exists?(@ngo)).to be true
        end

        it 'returns false when a new ngo is passed' do
          expect(@controller.ngo_exists?(@ngo_new)).to be false
        end
    end
end