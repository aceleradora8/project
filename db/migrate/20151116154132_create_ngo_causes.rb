class CreateNgoCauses < ActiveRecord::Migration
  def change
    create_table :ngo_causes do |t|
      t.integer :ngo_id
      t.integer :cause_id

      t.timestamps null: false
    end
  end
end
