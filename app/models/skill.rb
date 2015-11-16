class Skill < ActiveRecord::Base
	has_many :opportunity_skills
 	has_many :opportunities, through: :opportunity_skills 	
end
