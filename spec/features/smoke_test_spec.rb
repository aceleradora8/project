require "rails_helper"
require 'capybara/rspec'

feature "smoke test" do
	describe 'should display the title' do
		scenario 'visits home page' do
		  visit 'http://ongarium-stage.herokuapp.com/'
		  expect(page).to have_title 'OngariumRails'
		end
	end


end
