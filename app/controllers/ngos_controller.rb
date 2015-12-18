class NgosController < ApplicationController
	before_action :set_ngo, only: [:show, :edit, :destroy]
  before_action :require_ngo, only: [:edit, :destroy]

	def new
		@ngo = Ngo.new   
		@ngo.build_address
		@ngo.build_user
    @ngo.phones.build

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
      if(ngo_exists?(@ngo))
        format.html { 
          flash[:error] = "ONG já cadastrada!"          
          render :new}  
    	elsif(@ngo.save)
        set_ngo_list_phones(ngo_params[:phones_attributes]) if ngo_params[:phones_attributes] != nil
    		UserMailer.email_confirmation(@ngo).deliver
    		format.html { redirect_to @ngo, notice: "ONG cadastrada com sucesso, confirme o email para continuar" }
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
        @phones = Hash[@ngo.phones.map {|phone| [phone.id.to_s ,phone.phone_number]}]
        @phones = @phones.to_json
        format.html 
      end
    end
  end

  def update
    @ngo = Ngo.find(params[:id])
    @ngo.phones = []
    set_ngo_list_phones(ngo_params[:phones_attributes]) if ngo_params[:phones_attributes] != nil
    respond_to do |format|      
      if @ngo.update(ngo_params)
      format.html { redirect_to @ngo, notice: "ONG editada com sucesso!" }
      else
      format.html{ render 'edit', error: "Erro!" }
      end
    end
  end

  def destroy
    @ngo.user.email = nil
    @ngo.user.role = nil
    @ngo.destroy
    cookies.delete(:auth_token)
    respond_to do |format|
      format.html { redirect_to '/', notice: "A ONG foi removida com sucesso" }
    end
  end

    def ngo_exists?(ngo)
      (ngo.user.user_exists? || Ngo.find_by_name(ngo.name) != nil) ? true : false
    end

  private 
    def set_ngo
      if Ngo.where(:id => params[:id]).present?
        @ngo = Ngo.find(params[:id])
        if @ngo.privacy == true
          @ngo.address = Address.new
        end
      else
        redirect_to "/404"
      end
    end

    def ngo_params
      params.require(:ngo).permit(:user_id, :name, :description, :privacy, :address_attributes => [:address, :zipcode, :complement, :state, :city, :country, :neighborhood], :user_attributes => [:email, :password, :password_confirmation], :phones_attributes => [:phone_number])
    end

    def set_ngo_list_phones(phones_list)
      phones_list.each do |x, phone|
        if(phone[:phone_number] != "")
          new_phone = Phone.new(phone_number: phone[:phone_number], ngo_id: @ngo.id)
          new_phone.save
        end
      end
    end

end

