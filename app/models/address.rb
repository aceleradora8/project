class Address < ActiveRecord::Base
  has_one :ngo
  has_one :opportunity
  after_save :noaddress

  include PgSearch
  pg_search_scope :search, against: [:address, :city, :state, :country, :neighborhood], ignoring: :accents

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
    if zipcode == nil || address == nil
      destroy
    end
  end
end
