require 'correios-cep'


class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:show,:interest]
  before_action :set_causes,:set_cities, only: [:index]

  def index
    if params[:text_search] == nil || params[:text_search] == ""
      @opportunity_search = Opportunity.all.includes(:address,:ngo,:cause)
    else
      @opportunity_search = Opportunity.search("#{params[:text_search] }").includes(:address,:ngo,:cause)
    end
    respond_to do |format|
      if request.xhr? 
        @opportunities_result = [];
        if params[:causes] && params[:cities] 
          filter_with_causes_and_cities(params[:causes], params[:cities]);
        elsif params[:causes]
          filter_with_causes(params[:causes])
        elsif params[:cities]
          filter_with_cities(params[:cities])
        else
          @opportunities_result = @opportunity_search
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
  end

  def create

    finder = Correios::CEP::AddressFinder.new


    @opportunity = Opportunity.new(opportunity_params)
    ##pegar zipcode do carinha
    address = Correios::CEP::AddressFinder.get("91720090") 
    @skill = Skill.all
    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to "/opportunities/#{@opportunity.id}" , notice: 'Oportunidade cadastrada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  private 
    def set_opportunity
      if Opportunity.where(:id => params[:id]).present?
        @opportunity = Opportunity.find(params[:id])
      else
        redirect_to "/404"
      end
    end

    def set_causes
      @causes = Cause.all
    end

    def set_cities
      @cities = Address.uniq.pluck(:city)
    end

    def opportunity_params
      params.require(:opportunity).permit(:id, :title, :description, :start_date, :finish_date, :ngo_id, :cause_id, :vacancies, :address_attributes => [:address, :zipcode, :complement, :state, :city, :neighborhood], :skill_ids => [])
    end

    def filter_with_causes_and_cities(causes, cities)
      causes.each do |cause|
        cities.each do |city|
          @opportunities_result.push(@opportunity_search.select { |obj| obj.cause_id == cause.to_i && obj.address.city == city})
        end
      end
    end

    def filter_with_causes(causes)
      causes.each do |cause|
        @opportunities_result.push(@opportunity_search.select { |obj| obj.cause_id == cause.to_i })
      end
    end

    def filter_with_cities(cities)
      cities.each do |city|
        @opportunities_result.push(@opportunity_search.select { |obj| obj.address.city == city})
      end
    end
end