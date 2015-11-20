# require 'rails_helper'

# describe OpportunitiesController, type: :controller do
#     describe "#index" do
#         before :each do
#             @opportunitiesController = OpportunitiesController.new
#         end

#         it "returns all opportunities when text_search is nil" do
#             oppotunity = double(Opportunity)
#             allow(oppotunity).to receive(:all) { "all opportunities" }
#               get :index, :text_search => "teste"
#             expect(oppotunity.all).to be == "all opportunities"
#         end
#     end

# end