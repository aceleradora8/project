class Opportunity < ActiveRecord::Base	
	belongs_to :address
	belongs_to :ngo
	belongs_to :cause	
	has_many :opportunity_skills
 	has_many :skills, through: :opportunity_skills 	
end
