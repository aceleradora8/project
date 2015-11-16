class Opportunity < ActiveRecord::Base	
	belongs_to :address
	belongs_to :ngo
	belongs_to :cause	
	has_and_belongs_to_many :skills 	
end
