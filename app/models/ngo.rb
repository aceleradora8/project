class Ngo < ActiveRecord::Base
	belongs_to :address, dependent: :destroy
	belongs_to :user, dependent: :destroy
	has_many :phones, dependent: :destroy
	has_and_belongs_to_many :causes  	
	has_one :opportunity, dependent: :destroy
	validates :name, presence: true
  validates :description, presence: true

	accepts_nested_attributes_for :address
	accepts_nested_attributes_for :user

	include PgSearch
		 pg_search_scope :search, :against => [:name,:description] #(:ignoring => :accents)


end
