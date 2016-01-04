require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do

  describe '#create' do
  	before :each do
  		address = Address.create!(city:"POA", zipcode: "5", address:"rua")
  		@user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
  	end

  	it 'expect sucess when user email valid' do
  		post :create, email: @user.email
  		redirect_to login_url
  		expect(flash[:notice]).to eq("Confira seu email, enviamos instruções de recuperação de senha")
	end

	it 'expect error when user email doesnt exists' do
		post :create, email: 'qualquercoisa@lol.com'
		expect(flash[:error]).to eq("Email não cadastrado")
	end
  end

  describe '#edit' do
  	before :each do
  		@user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo", password_reset_token: "esseaqui")
  	end

  	# PROBLEMA NO MÉTODO, DISCUTIR COM O VELOSO
  	 it 'expect user to be equal a user passed in params' do
  		get :edit, id: "esseaqui"
  	 	expect(assigns(:user)).to eq(@user)
  	end
  end

  describe '#update' do
  	before :each do
  		address = Address.create!(city:"POA", zipcode: "5", address:"rua")
  		@user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo", password_reset_token: "esseaqui", password_reset_sent_at: Time.now)
  		@user2 = User.create!(email:"birra@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutokene2", role:"ngo", password_reset_token: "esseaqui2", password_reset_sent_at: Time.new(2008,6,21, 13,30,0, "+09:00"))
  	end

  	it 'return sucess when password is updated' do
  		put :update, {
  			id: @user.password_reset_token,
  			user: { email:"teste@teste.com", password: "321", password_confirmation: "321"}
  		}
  		expect(flash[:notice]).to eq("Sua senha foi alterada com sucesso!")
  	end

  	it 'return error when password reset token expired' do
  		put :update, {
  			id: @user2.password_reset_token,
  			user: { email:"teste@teste.com", password: "321", password_confirmation: "321"}
  		}
  		expect(flash[:alert]).to eq("Link de recuperação de senha expirado")
  	end

  	# Teste desnecessário, retirar o IF da Controller
  	# it 'renders edit when other thing goes wrong' do
  	# 	put :update, {
  	# 		id: @user2.password_reset_token,
  	# 		user: { email:"birra@teste.com", password: "321", password_confirmation: "321"}
  	# 	}
  	# 	expect(response).to render_template("edit")
  	# end

  end
end
