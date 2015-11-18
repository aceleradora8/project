class Ngo < ActiveRecord::Base
	belongs_to :address
	has_many :phones
	has_and_belongs_to_many :causes  	
	has_one :opportunity
	validates :address, :presence => true


	include PgSearch
		 pg_search_scope :search, :against => [:name,:description], :ignoring => :accents
end
