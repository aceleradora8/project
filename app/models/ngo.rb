class Ngo < ActiveRecord::Base
	belongs_to :address
	has_many :phones
	has_many :ngo_causes
 	has_many :causes, through: :ngo_causes 	
	has_one :opportunity
end
