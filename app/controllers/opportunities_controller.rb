class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:show, :interest, :edit, :update , :destroy]
  before_action :set_causes, :set_cities, only: [:index, :new, :edit, :create]
  before_action :set_skills, only: [:new, :create, :edit]
  before_action :set_weekdays, only: [:new, :create, :edit]
  before_action :set_shifts, only: [:new, :create, :edit]
  before_action :require_user, only: [:new, :create]
  before_action :require_ngo, only: [:new, :create, :my_opportunities]
  before_action only: [:edit, :update, :destroy] do
    opportunity = Opportunity.find(params[:id])
    ngo_owner_of_opportunity(opportunity)
  end
  helper OpportunitiesHelper

  def index
    if params[:text_search].blank?
       @opportunity_search = Opportunity.all.includes(:address, :ngo, :causes)
    else
       @opportunity_search = Opportunity.search(params[:text_search]).includes(:address, :ngo, :causes)
    end
    unless params[:city].blank?
       address_ids_cities = Address.search(params[:city]).map { |address| address.id }
       @opportunity_search = @opportunity_search.where(address: address_ids_cities)
    end
    respond_to do |format|
      if request.xhr?
        puts @opportunity_search[0]
        @opportunities_result = []
        if params[:causes] && params[:cities]
          @opportunities_result = filter_with_cities(filter_with_causes(@opportunity_search, params[:causes]), params[:cities])
        elsif params[:causes]
          @opportunities_result = filter_with_causes(@opportunity_search, params[:causes])
        elsif params[:cities]
          @opportunities_result = filter_with_cities(@opportunity_search, params[:cities])
        end
        @opportunities_result = Kaminari.paginate_array(@opportunities_result.flatten).page(params[:page])
        format.js
      else
        @opportunities_result = Kaminari.paginate_array(@opportunity_search).page(params[:page])
        format.html
      end
    end
  end

  def new
    @opportunity = Opportunity.new
    @opportunity.build_address
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

  def create
    @opportunity = Opportunity.new(opportunity_params)
    respond_to do |format|
      if @opportunity.save
        create_dates
        format.html { redirect_to "/opportunities/#{@opportunity.id}" , notice: 'Oportunidade cadastrada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @interest = Interest.new
  end

  def edit
    params[:dates_opportunities] = @opportunity.dates_opportunities.map { |date| "#{date.date},"}
    @opportunity.build_address if @opportunity.address.blank?
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
    if @opportunity.update(opportunity_params)
      create_dates
      redirect_to @opportunity
    else
      render 'edit'
    end
  end

  def destroy
    @opportunity.destroy
    respond_to do |format|
      format.html { redirect_to ngo_path(@opportunity.ngo), notice: "A oportunidade #{@opportunity.title} foi removida com sucesso" }
    end
  end

  def my_opportunities
    @user = current_user
    @ngo = Ngo.find_by_user_id(@user.id)
    @ngos_opportunities = @ngo.opportunities
    @ngos_opportunities = Kaminari.paginate_array(@ngos_opportunities.flatten).page(params[:page])
  end

  private

  def set_opportunity
    if Opportunity.where(id: params[:id]).present?
      @opportunity = Opportunity.find(params[:id])
    else
      redirect_to "/404"
    end
  end

  def set_skills
    @skill = Skill.all
  end

  def set_weekdays
    @weekday = Weekday.all
  end

  def set_shifts
    @shift = Shift.all
  end

  def set_causes
    @causes = Cause.all
  end

  def set_cities
    @cities = Address.uniq.pluck(:city)
  end

  def create_dates
    unless params[:dates_opportunities].nil?
      @opportunity.dates_opportunities.each { |date| date.destroy }
      params[:dates_opportunities].split(',').each do |date|
        DatesOpportunity.create(date:date, opportunity_id:@opportunity.id)
      end
    end
  end

  def opportunity_params
    params.require(:opportunity).permit(:title, :description, :data_type, :ngo_id, :vacancies, :requirements, address_attributes: [:address, :zipcode, :number, :complement, :state, :city, :neighborhood], skill_ids: [], weekday_ids: [], cause_ids: [], shift_ids: [])
  end

  def filter_with_causes(opportunities, causes)
      result = []
      opportunities.each do |opportunity|
        causes = causes.map {|causeid| Cause.find(causeid)}
        result.push(opportunity) if causes.all? { |e| opportunity.causes.include?(e)}
      end
      result
  end

  def filter_with_cities(opportunities, cities)
    result = []
    cities.each do |city|
      result.push(opportunities.select { |obj| obj.address.city == city})
    end
    result
  end
end
