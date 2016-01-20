class CreateWeekdays < ActiveRecord::Migration
  def change
    create_table :weekdays do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
