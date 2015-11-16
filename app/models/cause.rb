class Cause < ActiveRecord::Base
	has_and_belongs_to_many :ngos 	
	has_one :opportunity
end
