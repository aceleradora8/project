class CreateCausesNgos < ActiveRecord::Migration
  def change
    create_table :causes_ngos do |t|
      t.integer :ngo_id
      t.integer :cause_id
	  t.references :ngo, index: true
	  t.references :cause, index: true
    end
	add_foreign_key :causes_ngos, :ngos
	add_foreign_key :causes_ngos, :causes
  end
end
