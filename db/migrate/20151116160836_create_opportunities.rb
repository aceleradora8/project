class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :title
      t.text :description
      t.integer :address_id, foreign_key: true
      t.date :start_date
      t.date :finish_date
      t.integer :ngo_id, foreign_key: true
      t.integer :cause_id, foreign_key: true
      t.integer :vacancies

      t.timestamps null: false
    end
  end
end
