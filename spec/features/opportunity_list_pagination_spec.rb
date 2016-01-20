require "rails_helper"
require 'capybara/rspec'

feature 'opportunity list pagination tests' do

  describe '2 page list' do

    before :each do
      address = Address.create!(city:"POA", zipcode: "5", address:"rua")
      ngo = Ngo.create!(address_id: address.id, phone1: "1234", name:"nome", description: "Qualquer coisa")
      cause = Cause.create!
      (1..14).each do |index|
        opp = Opportunity.create!(title: "Opportunity #{index}", description: "Qualquer coisa", address_id: address.id, ngo_id: ngo.id)
        opp.causes.push(cause)
      end
    end

    scenario 'finds an opportunity at page 1' do
      visit 'opportunities?page=1'
      expect(page).to have_content 'Opportunity 1'
    end

    scenario 'finds an opportunity at page 2' do
      visit 'opportunities?page=2'
      expect(page).to have_content 'Opportunity 13'
    end

    scenario 'finds no opportunities at page 3' do
      visit 'opportunities?page=3'
      expect(page).to have_content 'Sua pesquisa não encontrou resultados'
    end

  end

  describe '1 page list' do

    before :each do
      address = Address.create!(city:"POA", zipcode: "5", address:"rua")
      ngo = Ngo.create!(address_id: address.id, phone1: "1234", name:"nome", description: "Qualquer coisa")
      cause = Cause.create!
      (1..5).each do |index|
        opp = Opportunity.create!(title: "Opportunity #{index}", description: "Qualquer coisa", address_id: address.id, ngo_id: ngo.id)
        opp.causes.push(cause)
      end
    end
        
    scenario 'finds no extra pages' do
      visit 'opportunities?page=1'
      expect(page).to have_content 'Opportunity'
    end

  end
end