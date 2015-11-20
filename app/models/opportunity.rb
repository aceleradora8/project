class Opportunity < ActiveRecord::Base	
	belongs_to :address, dependent: :destroy
	belongs_to :ngo
	belongs_to :cause
	has_and_belongs_to_many :skills
	has_many :interests
	validates :address, :presence => true
	validates :ngo, :presence => true
	validates :cause, :presence => true

	include PgSearch
		 pg_search_scope :search,  :against =>  [:title,:description], 
		 :associated_against =>  { 
		 	:ngo => [:name], 
		 	:address => [:neighbourhood, :city, :state], 
		 	:cause => [:name],
		 	:skills => [:name] }
		 	#:ignoring => :accents (Ver com o viola!)

end


