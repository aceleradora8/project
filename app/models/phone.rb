class Phone < ActiveRecord::Base
	belongs_to :ngo
	validates :ngo, :presence => true
end
