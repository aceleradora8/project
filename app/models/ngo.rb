class Ngo < ActiveRecord::Base
	belongs_to :address, dependent: :destroy
	has_many :phones, dependent: :destroy
	has_and_belongs_to_many :causes  	
	has_one :opportunity, dependent: :destroy
	validates :email, presence: true
	validates :name, presence: true	 	

	accepts_nested_attributes_for :address
	
	before_create :confirmation_token

	include PgSearch
		 pg_search_scope :search, :against => [:name,:description] #(:ignoring => :accents)

	def email_activate
		self.email_confirmed = true
		self.confirm_token = nil
		save!
	end

	private
	def confirmation_token
		if self.confirm_token.blank?
			self.confirm_token = SecureRandom.urlsafe_base64.to_s
		end
	end
end
