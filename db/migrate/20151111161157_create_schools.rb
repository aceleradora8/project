class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
