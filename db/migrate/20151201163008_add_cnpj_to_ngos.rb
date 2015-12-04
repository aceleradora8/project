class AddCnpjToNgos < ActiveRecord::Migration
  def change
  	add_column :ngos, :cnpj, :string
  end
end
