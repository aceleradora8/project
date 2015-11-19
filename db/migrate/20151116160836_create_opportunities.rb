class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :title
      t.text :description
      t.integer :address_id
      t.date :start_date
      t.date :finish_date
      t.integer :ngo_id
      t.integer :cause_id
      t.integer :vacancies
      t.timestamps null: false
	  t.references :address, index: true
	  t.references :ngo, index: true
	  t.references :causes, index: true
    end
	add_foreign_key :opportunities, :addresses
	add_foreign_key :opportunities, :ngos
	add_foreign_key :opportunities, :causes
  end
end
