class Opportunity < ActiveRecord::Base
	belongs_to :address, dependent: :destroy
	belongs_to :ngo
	belongs_to :cause
	has_and_belongs_to_many :skills
	has_many :interests
	validates :title, presence: true
	validates :description, presence: true
	validates :ngo, presence: true
	validates :cause, presence: true
	validate :valid_date_range_required
	accepts_nested_attributes_for :address

	def valid_date_range_required
		if start_date > finish_date
			errors.add(:date_range, "Data de inicio deve ser antes que data de termino.")
		end if recurrent == 0
	end

	include PgSearch
	pg_search_scope :search, against: [:title, :description], ignoring: :accents,
		 associated_against: {
			 ngo: [:name],
			 address: [:neighborhood, :city, :state],
			 cause: [:name],
			 skills: [:name]
		 }
end
