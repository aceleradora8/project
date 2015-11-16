class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone_number
      t.integer :ngo_id

      t.timestamps null: false
    end
  end
end
