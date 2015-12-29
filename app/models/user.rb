require 'bcrypt'

class User < ActiveRecord::Base
  has_one :ngo, dependent: :destroy
  has_one :volunteer, dependent: :destroy
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  include BCrypt
  has_secure_password
  before_create { generate_token(:auth_token) }
  before_create { generate_token(:confirm_token) }

  def email_activate
    self.confirmed = true
    self.confirm_token = nil
    save!
  end

  def ngo?
    role == "ngo"
  end

  def volunteer?
    role == "volunteer"
  end

  def admin?
    role == "admin"
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def user_exists?
    !User.find_by_email(email).nil? ? true : false
  end

  private
  def generate_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break unless User.exists?(column => self[column])
    end
  end
end
