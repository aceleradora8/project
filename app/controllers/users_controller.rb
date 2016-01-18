class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to new_ngo_path(user_id:@user.id)
		else
			render 'new'
		end
	end

	def show
	end

	def edit
		@user = User.find(params[:id])
		if @user.role == "ngo"
			@accountVariable = Ngo.find_by_user_id(@user.id)
		elsif @user.role = "volunteer"
			@accountVariable = Volunteer.find_by_user_id(@user.id)
		end
	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
				if @user.authenticate(params[:current_password])
						if @user.update(user_params)
								format.html { redirect_to login_path, notice: "Senha atualizada com sucesso!"}
						else
								render 'edit'
						end
				else
						format.html { redirect_to edit_user_path, error: "Senha antiga errada!" }
				end
		end
	end

	def confirm_email
		@user = User.find_by_confirm_token(params[:id])
		respond_to do |format|
			if !@user.nil?
				@user.email_activate
				format.html { redirect_to root_path, notice: "Email cadastrado com sucesso, bem vindo ao ONGARIUM." }
			else
				format.html { redirect_to login_path, error: "Token não encontrado. Usuário já ativado ou não existe." }
			end
		end
	end

	def resend_token
		@user = User.find_by_email(params[:email])
		respond_to do |format|
			if @user.nil?
				format.html { redirect_to login_path, error: "Email não cadastrado, por favor, cadastre-se."}
			elsif @user.confirmed == false
				UserMailer.resend_token(@user).deliver_later
				format.html { redirect_to login_path, notice: "Token de ativação enviado com sucesso. Verifique a caixa de entrada do seu Email." }
			else
				format.html { redirect_to login_path, error: "Email já ativado. Logue-se!" }
			end
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
