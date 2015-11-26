require 'rails_helper'

describe OpportunitiesController, type: :controller do
    describe '#index' do
        before :each do
          address = Address.create!()
        	ngo = Ngo.create!(address_id: address.id, email:'email')
        	cause = Cause.create!()
        	@opportunity1 = Opportunity.create!(title: 'Opportunity1', address_id: address.id, ngo_id: ngo.id, cause_id: cause.id)
        	@opportunity2 = Opportunity.create!(title: 'Opportunity2', address_id: address.id, ngo_id: ngo.id, cause_id: cause.id)
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