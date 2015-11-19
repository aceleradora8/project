class CreateNgos < ActiveRecord::Migration
  def change
    create_table :ngos do |t|
      t.string :name
      t.text :description
	  t.references :address, index: true
      t.timestamps null: false
    end
	add_foreign_key :ngos, :addresses
  end
end
