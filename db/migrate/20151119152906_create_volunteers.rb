class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :email
      t.string :name
      t.string :phone
      t.text :observations

      t.timestamps null: false
    end
  end
end
