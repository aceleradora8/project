class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone_number
      t.integer :ngo_id
	  t.references :ngo, index:true
      t.timestamps null: false
    end
	add_foreign_key :phones, :ngos
  end
end
