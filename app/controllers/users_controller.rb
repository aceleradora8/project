class UsersController < ApplicationController

	def new
		@user = User.new()
	end

	def create
		@user = User.new(user_params)
		 if @user.save
		 	redirect_to new_ngo_path(user_id:@user.id)
		 else
		 	render 'new'
		 end
	end

	def confirm_email
		@user = User.find_by_confirm_token(params[:id])
		respond_to do |format|
			if @user != nil
				@user.email_activate
				format.html { redirect_to "/", notice: "Email cadastrado com sucesso, bem vindo ao ONGARIUM." }
			else
				format.html { redirect_to root_path, notice: "Falha, a ONG não existe." }
			end
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
