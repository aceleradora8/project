class CreateOpportunitiesShifts < ActiveRecord::Migration
  def change
    create_table :opportunities_shifts do |t|
      t.integer :opportunity_id
      t.integer :shift_id
      t.references :opportunity, index: true
      t.references :shift, index: true
    end
  end
end
