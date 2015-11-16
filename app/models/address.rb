class Address < ActiveRecord::Base
	has_one :ngo
	has_one :opportunity
end
