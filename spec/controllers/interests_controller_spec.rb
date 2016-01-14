require 'rails_helper'

describe InterestsController, type: :controller do
  describe '#create' do
    before :each do
      address = Address.create!(city:"POA", zipcode: "5", address:"rua")
      @user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken1", role:"volunteer")
      user2 = User.create!(email:"tw@tw.com", password:"123321", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
      start_date = "2015-03-03"
      finish_date = "2015-04-03"
      @volunteer = Volunteer.create!(name:"Voluntário teste",observations:"teste", phone1:"(66)6666-6666", user_id: @user.id)
      @ngo = Ngo.create!(address_id: address.id, phone1: "1234", name:"nome1", description: "Qualquer coisa1",user_id:user2.id)
      @cause_animal = Cause.create!(name:"Animal")
      @opportunity1 = Opportunity.create!(title: 'Opportunity1', description: "Qualquer coisa", address_id: address.id, ngo_id: @ngo.id, start_date: start_date, finish_date: finish_date)
      @opportunity1.causes.push(@cause_animal)
    end

    it 'return success when Interest is created' do
      cookies[:auth_token] = @user.auth_token
      post :create, {interest: {opportunity_id: @opportunity1.id}}
      expect(flash[:notice]).to eq("Interesse registrado com sucesso")
    end
  end

  describe '#destroy' do
    before :each do
      address = Address.create!(city:"POA", zipcode: "5", address:"rua")
      user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken1", role:"volunteer")
      user2 = User.create!(email:"tw@tw.com", password:"123321", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
      start_date = "2015-03-03"
      finish_date = "2015-04-03"
      @volunteer = Volunteer.create!(name:"Voluntário teste",observations:"teste", phone1:"(66)6666-6666", user_id:user.id)
      @ngo = Ngo.create!(address_id: address.id, phone1: "1234", name:"nome1", description: "Qualquer coisa1",user_id:user2.id)
      @cause_animal = Cause.create!(name:"Animal")
      @opportunity1 = Opportunity.create!(title: 'Opportunity1', description: "Qualquer coisa", address_id: address.id, ngo_id: @ngo.id, start_date: start_date, finish_date: finish_date)
      @opportunity1.causes.push(@cause_animal)
      @interest = Interest.create!(volunteer_id: @volunteer.id, opportunity_id: @opportunity1.id, confirmed: true, presence: true)
      cookies[:auth_token] = user.auth_token
    end

    it 'return success when interest is destroyed' do
      delete :destroy, id: @opportunity1.id
      expect(flash[:notice]).to eq("Interesse desmarcado com sucesso")
    end
  end

  describe '#my_interests' do
    before :each do
      address = Address.create!(city:"POA", zipcode: "5", address:"rua")
      @user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken1", role:"volunteer")
      @volunteer = Volunteer.create!(name:"Voluntário teste",observations:"teste", phone1:"(66)6666-6666", user_id: @user.id)
      cookies[:auth_token] = @user.auth_token
    end

    it 'expect user to be current user and Volunteer equals user.volunteer' do
      get :my_interests
      expect(assigns(:user)).to eq(@user)
      expect(assigns(:volunteer)). to eq(@volunteer)
    end
  end
end
