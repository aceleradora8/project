require "rails_helper"
require 'capybara/rspec'

feature 'test if render and redirect pages when exist error' do
	describe 'volunteer' do
		it 'test if redirect to /404 when volunteer is invalid' do
			visit 'volunteers/-1'
			expect(page).to have_content("The page you were looking for doesn't exist.")
		end
	end
end