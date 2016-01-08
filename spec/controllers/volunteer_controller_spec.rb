require "rails_helper"
require 'capybara/rspec'

describe VolunteersController, type: :controller do
	describe '#create' do
		before :each do
			user = User.create!(email:"teste_voluntario@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"volunteer")
			@volunteer_teste = Volunteer.create!(name:"Voluntário teste",observations:"teste", phone:"(66)6666-6666", user_id:user.id)
			user_new = User.new(email:"teste_novo_voluntario@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"volunteer")
			@volunteer_new = Volunteer.new(name:"Voluntário Novo",observations:"teste", phone:"(66)6666-6666", user_id:user_new)
			@controller = VolunteersController.new
		end

		it 'return error when passing a volunteer existing email' do
			post :create, volunteer: {
			user_attributes: { email: "teste_voluntario@teste.com"}
			}

			redirect_to new_volunteer_url
			expect(flash[:error]).to eq("O email informado já está cadastrado")
		end

		it 'return success message when passing a volunteer with new email' do
			post :create, volunteer: {
			name:"name",
			phone:"(66)6666-6666",
			user_attributes: { email: "new_email@teste.com", password: "123", password_confirmation: "123"}
			}

			redirect_to login_url
			expect(flash[:notice]).to eq("Voluntário cadastrado com sucesso, confirme o email para continuar!")
		end

		it 'render new if anything goes wrong' do
			post :create, volunteer: {
			name: nil,
			phone:"(66)6666-6666",
			user_attributes: { email: "new_email@teste.com", password: "123", password_confirmation: "123"}
			}

			expect(response).to render_template("new")
		end
	end

	describe '#update' do
		before :each do
			user = User.create!(email:"teste_voluntario@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"volunteer")
			@volunteer_teste = Volunteer.create!(name:"Voluntário teste",observations:"teste", phone:"(66)6666-6666", user_id:user.id)
			user_new = User.new(email:"teste_novo_voluntario@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"volunteer")
			@volunteer_new = Volunteer.new(name:"Voluntário Novo",observations:"teste", phone:"(66)6666-6666", user_id:user_new)
			@controller = VolunteersController.new
		end

		it 'return success message when volunteer was updated' do
			put :update, id: @volunteer_teste.id,
			volunteer: {
			name:"Voluntário atualizado",
			phone:"(66)6666-6666",
			user_attributes: { email: "new_email@teste.com", password: "123", password_confirmation: "123"}
			}

			redirect_to @volunteer_teste
			expect(flash[:notice]).to eq("Voluntário atualizado com sucesso!")
		end

		it 'render new if anything goes wrong' do
			put :update, id: @volunteer_teste.id,
			volunteer: {
			name: nil,
			phone:"(66)6666-6666",
			user_attributes: { email: "new_email@teste.com", password: "123", password_confirmation: "123"}
			}

			expect(response).to render_template("edit")
		 end
	end

	describe '#destroy' do
		before :each do
			user = User.create!(email:"teste_voluntario@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"volunteer")
			@volunteer_teste = Volunteer.create!(name:"Voluntário teste",observations:"teste", phone:"(66)6666-6666", user_id:user.id)
			user_new = User.new(email:"teste_novo_voluntario@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"volunteer")
			@volunteer_new = Volunteer.new(name:"Voluntário Novo",observations:"teste", phone:"(66)6666-6666", user_id:user_new)
			@controller = VolunteersController.new
		end

		it 'return success when volunteer is deleted' do
			cookies[:auth_token] = @volunteer_teste.user.auth_token
			delete :destroy, id: @volunteer_teste.id
			expect(flash[:notice]).to eq("Voluntário deletado com sucesso!")
			expect(cookies[:auth_token]).to be nil
		end
	end

	describe '#new' do
		it 'verify if volunteers is a Volunteer instance' do
			get :new
			expect(assigns(:volunteer)).to be_a_new(Volunteer)
		end
	end
end
