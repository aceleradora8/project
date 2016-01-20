class CreateOpportunitiesWeekdays < ActiveRecord::Migration
  def change
    create_table :opportunities_weekdays do |t|
      t.integer :opportunity_id
      t.integer :weekday_id
      t.references :opportunity, index: true
      t.references :weekday, index: true
    end
  end
end
