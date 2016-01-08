class Opportunity < ActiveRecord::Base
	belongs_to :address, dependent: :destroy
	belongs_to :ngo
	belongs_to :cause
	has_and_belongs_to_many :skills
	has_many :interests, dependent: :destroy
	validates :title, presence: true
	validates :description, presence: true
	validates :ngo, presence: true
	validates :cause, presence: true
	accepts_nested_attributes_for :address

	include PgSearch
	pg_search_scope :search, against: [:title, :description], ignoring: :accents,
		 associated_against: {
			 ngo: [:name],
			 address: [:neighborhood, :city, :state],
			 cause: [:name],
			 skills: [:name]
		 }
end
