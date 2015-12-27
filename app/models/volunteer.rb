class Volunteer < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :interests
  validates :name, presence: true
  validates :phone, presence: true
  accepts_nested_attributes_for :user
end
