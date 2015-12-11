class Address < ActiveRecord::Base
  has_one :ngo
  has_one :opportunity
  validates :address, :presence => true
  validates :zipcode, :presence => true

  def print_address
    if self.zipcode
      "#{self.address},  #{self.complement} -
       #{self.neighborhood}, #{self.city} -
       #{self.state}, #{self.country}, #{self.zipcode}"
    else
      "Endereço não informado."
    end
  end
end
