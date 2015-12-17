require 'rails_helper'
require 'capybara/rspec'

describe OpportunitiesController, type: :controller do
  describe '#index' do
      before :each do
        @address_poa = Address.create!(city:"POA", zipcode: "5", address:"rua")
        @address_viamao = Address.create!(city:"Viamão", zipcode: "5", address:"rua")
      	ngo = Ngo.create!(address_id: @address_poa.id, name:"nome", description: "Qualquer coisa")
      	@cause_animal = Cause.create!(name:"Animal")
        @cause_health = Cause.create!(name:"health")
        start_date = "2015-03-03"
        finish_date = "2015-04-03"
      	@opportunity1 = Opportunity.create!(title: 'Opportunity1', description: "Qualquer coisa", address_id: @address_poa.id, ngo_id: ngo.id, cause_id: @cause_animal.id, start_date: start_date, finish_date: finish_date)
      	@opportunity2 = Opportunity.create!(title: 'Opportunity2', description: "Qualquer coisa", address_id: @address_viamao.id, ngo_id: ngo.id, cause_id: @cause_health.id, start_date: start_date, finish_date: finish_date)
        @controller = OpportunitiesController.new
      end

      it 'returns all opportunities when text_search is nil' do
        get :index, text_search: nil

        expect(assigns(:opportunity_search)).to match_array([@opportunity1,@opportunity2])
      end

      it 'returns all opportunities when text_search is empty' do
        get :index, text_search: ''

        expect(assigns(:opportunity_search)).to match_array([@opportunity1,@opportunity2])
      end
      
      it 'returns the opportunity when text_search matches the title' do
        get :index, text_search: 'Opportunity1'

        expect(assigns(:opportunity_search)).to match_array([@opportunity1])
      end
  
      it 'returns Viamãos and healths opportunities when city is Viamão and cause is health' do
        xhr :get, :index, {cities: [@address_viamao.city], causes:[@cause_health]}
        expect(assigns(:opportunities_result)).to match_array([@opportunity2])
      end

      it 'returns Animals opportunities when cause is Animal' do
        xhr :get, :index, {causes: [@cause_animal.id]}
        expect(assigns(:opportunities_result)).to match_array([@opportunity1])
      end

      it 'returns POAs opportunities when city is POA' do
        xhr :get, :index, {cities: [@address_poa.city]}
        expect(assigns(:opportunities_result)).to match_array([@opportunity1])
      end
  end
end