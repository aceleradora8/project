class Volunteer < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :email, format: { with: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/,
    message: "Email inválido",:multiline => true }
	validates :phone, presence: true
	validates :phone, format: { with: /^([0-9]{2})?(\([0-9]{2})\)([0-9]{3}|[0-9]{4})-[0-9]{4}$/,
    message: "Telefone inválido",:multiline => true}
	
	has_many :interests
end
 