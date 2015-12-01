class UpdateCountryAddress < ActiveRecord::Migration
  def change
  	change_column :addresses, :country, :string, :default => "Brasil"
  end
end
