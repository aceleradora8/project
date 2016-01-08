class AddPhonesNgos < ActiveRecord::Migration
  def change  	
    add_column :ngos, :phone1, :string
    add_column :ngos, :phone2, :string
  end
end
