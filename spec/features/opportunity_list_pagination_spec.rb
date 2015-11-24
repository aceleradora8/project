require 'capybara/rspec'

feature "opportunity list pagination tests" do

	 describe "2 page list" do

        before :each do
            address = Address.create!()
        	ngo = Ngo.create!(address_id:address.id, email:"email")
        	cause = Cause.create!()
        	(1..14).each do |index|
        		Opportunity.create!(title: "Opportunity #{index}", address_id:address.id, ngo_id:ngo.id,cause_id:cause.id)
        	end
        end

		scenario "finds an opportunity at page 1" do
			visit 'opportunities?page=1'
			expect(page).to have_content 'Opportunity 1'
			expect(page).to have_no_content 'Sua pesquisa não encontrou resultados'
		end

		scenario "finds an opportunity at page 2" do
			visit 'opportunities?page=2'
			expect(page).to have_content 'Opportunity 13'
			expect(page).to have_no_content 'Sua pesquisa não encontrou resultados'
		end

		scenario "finds no opportunities at page 3" do
			visit 'opportunities?page=3'
			expect(page).to have_content 'Sua pesquisa não encontrou resultados'
			expect(page).to have_no_content 'Opportunity'
		end

	end

	describe "1 page list" do
		before :each do
            address = Address.create!()
        	ngo = Ngo.create!(address_id:address.id, email:"email")
        	cause = Cause.create!()
        	(1..5).each do |index|
        		Opportunity.create!(title: "Opportunity #{index}", address_id:address.id, ngo_id:ngo.id,cause_id:cause.id)
        	end
        end
        
		scenario "finds no extra pages" do
			visit 'opportunities?page=1'
			expect(page).to have_content 'Opportunity'
			expect(page).to have_no_content 'Próximo'
		end

	end
end