require 'bcrypt'

class User < ActiveRecord::Base
	has_one :ngo, dependent: :destroy

	include BCrypt

	has_secure_password

	before_create :confirmation_token

	def email_activate
		self.confirmed = true
		self.confirm_token = nil
		save!
	end

	def ngo?
		self.role == "ngo"
	end

	def volunteer?
		self.role == "volunteer"
	end

	def admin?
		self.role == "admin"
	end

	private
	def confirmation_token
		if self.confirm_token.blank?
			self.confirm_token = SecureRandom.urlsafe_base64.to_s
		end
	end

end
