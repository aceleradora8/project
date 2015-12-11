require 'rails_helper'

describe NgosController, type: :controller do
    describe '#index' do
        before :each do
          address = Address.create!(city:"POA", zipcode: "5", address:"rua")
          user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
        	@ngo = Ngo.create!(address_id: address.id, name:"nome", description: "Qualquer coisa",user_id:user.id)
          @controller = NgosController.new
        end

        it 'returns true when passing a ngos existing name' do
          expect(@controller.ngo_exists?(@ngo.name, "")).to be true
        end

        it 'returns true when passing a ngos existing email' do
          expect(@controller.ngo_exists?("", @ngo.user.email)).to be true
        end

        it 'returns false when a wrong name is passed' do
          expect(@controller.ngo_exists?("blablabla", "bla@bla.com")).to be false
        end

      end
    end