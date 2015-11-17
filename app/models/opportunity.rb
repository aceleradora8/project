class Opportunity < ActiveRecord::Base	
	belongs_to :address
	belongs_to :ngo
	belongs_to :cause	
	has_and_belongs_to_many :skills
	#validates :address, :presence => true
	
	#validates :ngo, :presence => true
	#validates :cause, :presence => true

	include PgSearch
		 pg_search_scope :search, :against => [:title,:description], :ignoring => :accents
end
