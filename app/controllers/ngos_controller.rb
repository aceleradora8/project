class NgosController < ApplicationController
  before_action :set_ngo, only: [:show, :edit, :destroy]
  before_action :set_causes, :set_cities, only: [:index, :new, :edit, :create, :update]
  before_action :require_ngo, only: [:edit, :destroy]
  before_action :user_not_registered, only: [:new]
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
    if params[:text_search].blank?
       @ngos_search = Ngo.all.includes(:address, :causes)
    else
       @ngos_search = Ngo.search(params[:text_search]).includes(:address, :causes)
    end
    unless params[:city].blank?
       address_ids_cities = Address.search(params[:city]).map { |address| address.id }
       @ngos_search = @ngos_search.where(address: address_ids_cities)
    end
    @ngos_search = @ngos_search.select {|ngo| ngo.user.confirmed == true}
    respond_to do |format|
      if request.xhr?
            @ngos_result = []
            if params[:causes] && params[:cities]
              @ngos_result = filter_with_cities(filter_with_causes(@ngos_search, params[:causes]), params[:cities])
            elsif params[:causes]
              @ngos_result = filter_with_causes(@ngos_search, params[:causes])
            elsif params[:cities]
              @ngos_result = filter_with_cities(@ngos_search, params[:cities])
            end
            @ngos_result = Kaminari.paginate_array(@ngos_result.flatten).page(params[:page])
            format.js
      else
        @ngos_result = Kaminari.paginate_array(@ngos_search).page(params[:page])
        format.html
      end
    end
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
          flash[:error] = nil
        end
      elsif @ngo.save
        UserMailer.email_confirmation(@ngo).deliver_later
        format.html { redirect_to login_path, notice: "Organização cadastrada com sucesso! Foi enviado um e-mail de confirmação, verifique sua caixa de entrada." }
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
        format.html { redirect_to @ngo, notice: "Informações atualizadas com sucesso!" }
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
        format.html { redirect_to '/', notice: "A organização foi removida com sucesso!" }
      end
    else
      respond_to do |format|
        format.html { redirect_to edit_user_path, error: "Senha incorreta" }
      end
    end
  end

  def ngo_exists?(ngo)
    if Ngo.find_by_name(ngo.name).present?
      @error_message = "Já existe uma organização cadastrada com este nome."
      return true
    elsif User.find_by_email(ngo.user.email).present?
      @error_message = "E-mail já cadastrado!"
      return true
    else
      return false
    end
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
		params.require(:ngo).permit(:user_id, :name, :phone1, :phone2, :contact_email, :description, :privacy, :mission, address_attributes: [:address, :zipcode, :number, :complement, :state, :city, :country, :neighborhood], user_attributes: [:email, :password, :password_confirmation], cause_ids: [])
  end

  def set_cities
    @cities = Address.uniq.pluck(:city)
  end

  def set_causes
    @causes = Cause.all
  end

  def filter_with_causes(ngos, causes)
    result = []
    ngos.each do |ngo|
      causes = causes.map {|causeid| Cause.find(causeid)}
      result.push(ngo) if causes.all? { |e| ngo.causes.include?(e)}
    end
    result
  end

  def filter_with_cities(ngos, cities)
    result = []
    cities.each do |city|
      result.push(ngos.select { |obj| obj.address.city == city})
    end
    result
  end
end
