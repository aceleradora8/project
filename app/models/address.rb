class Address < ActiveRecord::Base
	has_one :ngo
	has_one :opportunity

	def print_address
		"#{self.address},  #{self.complement} -
		 #{self.neighbourhood}, #{self.city} -
		 #{self.state}, #{self.country}, #{self.cep}"
	end
end
