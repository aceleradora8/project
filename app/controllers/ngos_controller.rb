class NgosController < ApplicationController
	before_action :set_ngo, only: [:show]

	def new
		@ngo = Ngo.new
		@ngo.build_address
		@ngo.build_user
		3.times { @ngo.phones.build }
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

