require 'rails_helper'

describe OpportunitiesController, type: :controller do
    describe '#index' do
        before :each do
          address = Address.create!(city:"POA", zipcode: "5", address:"rua")
        	ngo = Ngo.create!(address_id: address.id, name:"nome", description: "Qualquer coisa")
        	cause = Cause.create!()
          start_date = "2015-03-03"
          finish_date = "2015-04-03"
        	@opportunity1 = Opportunity.create!(title: 'Opportunity1', description: "Qualquer coisa", address_id: address.id, ngo_id: ngo.id, cause_id: cause.id, start_date: start_date, finish_date: finish_date)
        	@opportunity2 = Opportunity.create!(title: 'Opportunity2', description: "Qualquer coisa", address_id: address.id, ngo_id: ngo.id, cause_id: cause.id, start_date: start_date, finish_date: finish_date)
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
    end
end