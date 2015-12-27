class Address < ActiveRecord::Base
  has_one :ngo
  has_one :opportunity
  validates :address, presence: true
  validates :zipcode, presence: true

  def print_address
    if zipcode
      "#{address},  #{complement} -
       #{neighborhood}, #{city} -
       #{state}, #{country}, #{zipcode}"
    else
      "Endereço não informado."
    end
  end
end
