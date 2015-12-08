class NgosController < ApplicationController
	before_action :set_ngo, only: [:show]

	def new
		@ngo = Ngo.new
    finder = Correios::CEP::AddressFinder.new
		@ngo.build_address
		@ngo.build_user
    @ngo.phones.build

     respond_to do |format|
      if request.xhr? 
        if params[:zipcode] 
          @address = Address.new(Correios::CEP::AddressFinder.get(params[:zipcode]))
          format.json
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
    @user_email = User.find_by_email(ngo_params[:user_attributes][:email])
    @ngo_name = Ngo.find_by_name(ngo_params[:name])
    @ngo = Ngo.new(ngo_params)
    respond_to do |format|
      if(@user_email != nil)
        flash[:error] = "Erro. Email já existe!"
        format.html { redirect_to request.referrer}
      elsif(@ngo_name != nil)
        flash[:error] = "Erro. Ong já existe!"
        format.html { redirect_to request.referrer}
      else
        @ngo.user.role = "ngo"
    		if(@ngo.save)
    			ngo_params[:phones_attributes].each do |x, phone|
      		  if(phone[:phone_number] != "")
              p = Phone.new(phone_number: phone[:phone_number], ngo_id: @ngo.id)
      			  p.save
            end
     			end
    		UserMailer.email_confirmation(@ngo).deliver
    		format.html { redirect_to @ngo, notice: "ONG cadastrada com sucesso, confirme o email para continuar" }
    		else
    			render 'new'
    		end
    	end
    end
  end

	private 
    def set_ngo
      if Ngo.where(:id => params[:id]).present?
        @ngo = Ngo.find(params[:id])
      else
        redirect_to "/404"
      end
    end

	private
		def ngo_params
			params.require(:ngo).permit(:user_id, :name, :description, :privacy, :address_attributes => [:address, :zipcode, :complement, :state, :city, :country, :neighborhood], :user_attributes => [:email, :password, :password_confirmation], :phones_attributes => [:phone_number])
		end
end

