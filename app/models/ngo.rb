class Ngo < ActiveRecord::Base
	belongs_to :address
	has_many :phones
	has_and_belongs_to_many :causes  	
	has_one :opportunity
end
