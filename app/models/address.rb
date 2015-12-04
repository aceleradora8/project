class Address < ActiveRecord::Base
	has_one :ngo
	has_one :opportunity
	validates :address, :presence => true
	validates :zipcode, :presence => true

	def print_address
		"#{self.address},  #{self.complement} -
		 #{self.neighborhood}, #{self.city} -
		 #{self.state}, #{self.country}, #{self.zipcode}"
	end
end
