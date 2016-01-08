class RemovePhones < ActiveRecord::Migration
  def change
  	drop_table :phones
  end
end
