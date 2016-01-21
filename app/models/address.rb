class Address < ActiveRecord::Base
  has_one :ngo
  has_one :opportunity
  after_save :noaddress

  def print_address
    if zipcode && number != nil
      "#{address}, #{number}, #{complement} -
       #{neighborhood}, #{city} -
       #{state}, #{country}, #{zipcode}"
    elsif zipcode && number == nil
      "#{address}, S/N -
       #{neighborhood}, #{city} -
       #{state}, #{country}, #{zipcode}"
     else
       "Endereço não informado."
    end
  end

  def noaddress
    if self.zipcode == nil || self.address == nil
      self.destroy()
    end
  end
end
