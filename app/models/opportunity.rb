class Opportunity < ActiveRecord::Base
	belongs_to :address, dependent: :destroy
	belongs_to :ngo
	has_and_belongs_to_many :skills
  has_and_belongs_to_many :weekdays
  has_and_belongs_to_many :shifts
	has_and_belongs_to_many :causes
	has_many :interests, dependent: :destroy
  has_many :dates_opportunities, dependent: :destroy
	validates :title, presence: true
	validates :description, presence: true
	validates :ngo, presence: true
	accepts_nested_attributes_for :address

	include PgSearch
	pg_search_scope :search, against: [:title, :description], ignoring: :accents,
		 associated_against: {
			 ngo: [:name],
			 address: [:neighborhood, :city, :state],
			 causes: [:name],
			 skills: [:name]
		 }
end
