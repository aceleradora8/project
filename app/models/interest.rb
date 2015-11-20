class Interest < ActiveRecord::Base
	belongs_to :volunteer
	belongs_to :opportunity
end
