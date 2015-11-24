class Ngo < ActiveRecord::Base
	belongs_to :address, dependent: :destroy
	has_many :phones, dependent: :destroy
	has_and_belongs_to_many :causes  	
	has_one :opportunity, dependent: :destroy
	validates :address, :presence => true


	include PgSearch
		 pg_search_scope :search, :against => [:name,:description] #(:ignoring => :accents)
end
