class CreateCausesNgos < ActiveRecord::Migration
  def change
    create_table :causes_ngos do |t|
      t.integer :ngo_id
      t.integer :cause_id
    end
  end
end
