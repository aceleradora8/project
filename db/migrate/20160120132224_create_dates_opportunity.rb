class CreateDatesOpportunity < ActiveRecord::Migration
  def change
    create_table :dates_opportunities do |t|
      t.date :date
      t.integer :opportunity_id
      t.timestamps null: false
    end
  end
end