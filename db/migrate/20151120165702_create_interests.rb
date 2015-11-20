class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :volunteer_id
      t.integer :opportunity_id
      t.boolean :confirmed
      t.boolean :presence

      t.timestamps null: false
    end
  end
end
