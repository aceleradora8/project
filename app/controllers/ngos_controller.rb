class NgosController < ApplicationController
	before_action :set_ngo, only: [:show, :edit, :destroy]
 before_action :require_ngo, only: [:edit, :destroy]
 helper NgosHelper

	def new
		@ngo = Ngo.new
		@ngo.build_address
		@ngo.build_user
		respond_to do |format|
			if request.xhr?
				if params[:zipcode]
					format.json { render json: Address.new(Correios::CEP::AddressFinder.get(params[:zipcode]))}
				end
			else
				format.html
			end
		end
	end

	def index
		@ngos_result = Ngo.all.includes(:address, :user).page params[:page]
	end

	def show
	end

	def create
		@ngo = Ngo.new(ngo_params)
		@ngo.user.role = "ngo"
		respond_to do |format|
			if ngo_exists?(@ngo)
				format.html do
					flash[:error] = "#{@error_message}"
					render 'new'
				end
			elsif @ngo.save
				UserMailer.email_confirmation(@ngo).deliver
				format.html { redirect_to login_path, notice: "ONG cadastrada com sucesso, confirme o email para continuar" }
			else
				format.html { render 'new' }
			end
		end
	end

 def edit
   @ngo = Ngo.find(params[:id])
   respond_to do |format|
     if request.xhr?
       if params[:zipcode]
         format.json { render json: Address.new(Correios::CEP::AddressFinder.get(params[:zipcode]))}
       end
     else
       format.html
     end
   end
 end

 def update
   @ngo = Ngo.find(params[:id])
    respond_to do |format|
     if @ngo.update(ngo_params)
     format.html { redirect_to @ngo, notice: "ONG atualizada com sucesso" }
     else
     format.html { render 'edit', error: "Erro!" }
     end
   end
 end

 def destroy
  if @ngo.user.authenticate(params[:password])
		@ngo.destroy
   	cookies.delete(:auth_token)
   	respond_to do |format|
     	format.html { redirect_to '/', notice: "A ONG foi removida com sucesso" }
   	end
 	else
		respond_to do |format|
			format.html { redirect_to @ngo, error: "Senha incorreta" }
		end
	end
 end

 def ngo_exists?(ngo)
   if Ngo.find_by_name(ngo.name).present?
		 @error_message = "Já existe uma ONG cadastrada com este nome."
		 return true
	 elsif User.find_by_email(ngo.user.email).present?
		 @error_message = "Email já cadastrado!"
		 return true
	 end
	 return false
 end

  private
 def set_ngo
   if Ngo.where(id: params[:id]).present?
     @ngo = Ngo.find(params[:id])
     if @ngo.privacy == true
       @ngo.address = Address.new
     end
   else
     redirect_to "/404"
   end
 end

 def ngo_params
   params.require(:ngo).permit(:user_id, :name, :phone1, :phone2, :description, :privacy, :mission, address_attributes: [:address, :zipcode, :number, :complement, :state, :city, :country, :neighborhood], user_attributes: [:email, :password, :password_confirmation])
 end
end
