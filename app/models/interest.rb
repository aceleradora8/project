class Interest < ActiveRecord::Base
	belongs_to :volunteer
	belongs_to :opportunity

	accepts_nested_attributes_for :volunteer, :opportunity
end
