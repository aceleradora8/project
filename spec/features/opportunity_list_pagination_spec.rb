require "rails_helper"
require 'capybara/rspec'

feature 'opportunity list pagination tests' do

  describe '2 page list' do

    before :each do
      address = Address.create!(city:"POA", zipcode: "5", address:"rua")
      ngo = Ngo.create!(address_id: address.id, name:"nome", description: "Qualquer coisa")
      cause = Cause.create!
      start_date = "2015-03-03"
      finish_date = "2015-04-03"
      (1..14).each do |index|
        Opportunity.create!(title: "Opportunity #{index}", description: "Qualquer coisa", address_id: address.id, ngo_id: ngo.id, cause_id: cause.id, start_date: start_date, finish_date: finish_date)
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
      ngo = Ngo.create!(address_id: address.id, name:"nome", description: "Qualquer coisa")
      cause = Cause.create!
      start_date = "2015-03-03"
      finish_date = "2015-04-03"
      (1..5).each do |index|
      Opportunity.create!(title: "Opportunity #{index}", description: "Qualquer coisa", address_id: address.id, ngo_id: ngo.id, cause_id: cause.id, start_date: start_date, finish_date: finish_date)
      end
    end
        
    scenario 'finds no extra pages' do
      visit 'opportunities?page=1'
      expect(page).to have_content 'Opportunity'
    end

  end
end