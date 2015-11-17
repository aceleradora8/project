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
    end
  end
end
