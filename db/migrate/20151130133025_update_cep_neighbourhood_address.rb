class UpdateCepNeighbourhoodAddress < ActiveRecord::Migration
  def change
  	rename_column :addresses, :cep, :zipcode
  	rename_column :addresses, :neighbourhood, :neighborhood
  end
end
