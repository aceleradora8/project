class Volunteer < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :interests, dependent: :destroy

  validates :name, presence: true  
  validates :phone1, presence: true

  accepts_nested_attributes_for :user
end
