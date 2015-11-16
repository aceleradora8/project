class Cause < ActiveRecord::Base
	has_many :ngo_causes
 	has_many :ngos, through: :ngo_causes 	
	has_one :opportunity
end
