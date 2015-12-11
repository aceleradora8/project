require 'rails_helper'

describe Address, type: :model do
	describe 'address' do
    	before :each do
            @address = Address.new(address:"Av Ipiranga",zipcode:"90619-900",city:"Porto Alegre", state:"Rio Grande do Sul",country:"Brasil", neighborhood: "Partenon", complement: "6681")
            @address_zipcode_nil = Address.new(address:"Av Ruas",city:"Porto Triste", state:"Rio Grande do Sul",country:"Hue", neighborhood: "Parteninho", complement: "666")
        end

        it 'print address if zipcode isnt empty' do
            expect(@address.print_address).to eq("Av Ipiranga,  6681 -\n       Partenon, Porto Alegre -\n       Rio Grande do Sul, Brasil, 90619-900")
        end

        it 'print address if zipcode is empty' do
            expect(@address_zipcode_nil.print_address).to eq("Endereço não informado.")
        end
	end
end