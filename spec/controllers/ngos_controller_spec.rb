require 'rails_helper'

describe NgosController, type: :controller do
  describe '#index' do
    before :each do
      address = Address.create!(city:"POA", zipcode: "5", address:"rua")
      user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
      user2 = User.create!(email:"tw@tw.com", password:"123321", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
      @ngo = Ngo.create!(address_id: address.id, name:"nome1", description: "Qualquer coisa1",user_id:user.id)
      @ngo2 = Ngo.create!(address_id: address.id, name:"nome2", description: "Qualquer coisa2",user_id:user2.id)
      user_new = User.new(email:"new@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
      @ngo_new = Ngo.new(address_id: address.id, name:"nome_new", description: "Qualquer coisa",user:user_new)
      @controller = NgosController.new
    end

    it 'show all results when index' do
      get :index
      expect(assigns[:ngos_result]).to match_array([@ngo, @ngo2])
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

    it 'returns false when ngo was deleted' do
      @ngo.user.email = nil
      @ngo.user.role = nil
      @ngo.destroy
      expect(@controller.ngo_exists?(@ngo)).to be false
    end

    it 'return sucess if NGO was created' do
      mailer = instance_double("mailer", deliver: "enviou")
      allow(UserMailer).to receive(:email_confirmation) { mailer }
      post :create, {ngo: 
        {
        name:"ABC", 
        description:"Abobora", 
        privacy: true, 
        address_attributes: {address:"end atualizado", zipcode:"66666-333", complement:"atualizado", state:"UP", city:"Atual", country:"Brasil", neighborhood:"Atualizado" },
        user_attributes: {email:"abc@pop.com", password: "123", password_confirmation: "123"},
        phones_attributes: {"1"=>{phone_number:"123456789"} }
        }
      }
        redirect_to ngo_path('1')
        expect(flash[:notice]).to eq("ONG cadastrada com sucesso, confirme o email para continuar")
    end
  end

  describe '#edit' do
    before :each do
      address = Address.create!(city:"POA", zipcode: "5", address:"rua")
      @user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
      @ngo = Ngo.create!(address_id: address.id, name:"nome", description: "Qualquer coisa",user_id:@user.id)
      user_new = User.new(email:"new@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
      @ngo_new = Ngo.new(address_id: address.id, name:"nome_new", description: "Qualquer coisa",user:user_new)
    end

    it 'return success when ngo is updated' do
      put :update, 
      {
        id: @ngo.id, ngo: 
        {
          name:"ONG atualizada", description:"ae", privacy:false, 
          address_attributes: {address:"end atualizado", zipcode:"66666-333", complement:"atualizado", state:"UP", city:"Atual", country:"Brasil", neighborhood:"Atualizado"}          
        }
      }     
      redirect_to @ngo
      expect(flash[:notice]).to eq("ONG atualizada com sucesso") 
    end

  end

  describe '#destroy' do
    before :each do

      address = Address.create!(city:"POA", zipcode: "5", address:"rua")
      @user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
      @ngo = Ngo.create!(address_id: address.id, name:"nome", description: "Qualquer coisa",user_id:@user.id)
      user_new = User.new(email:"new@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
      @ngo_new = Ngo.new(address_id: address.id, name:"nome_new", description: "Qualquer coisa",user:user_new)
    end

    # it 'return sucees when the NGO was deleted' do
    #   delete :destroy, id: @ngo.id,
    #   :authenticity_token => "esseehmeutoken"
    #   redirect_to root_path
    #   expect(flash[:notice]).to eq("A ONG foi removida com sucesso")
    # end
  end
  
  describe '#new' do
    it 'expect ngo be a instance of Ngo' do
      get :new
      expect(assigns(:ngo)).to be_a_new(Ngo)
    end
  end
end