class CreateOpportunitiesCauses < ActiveRecord::Migration
  def change
    create_table :opportunities_causes do |t|
	   	t.integer :opportunity_id
	    t.integer :cause_id
		  t.references :opportunity, index: true
		  t.references :cause, index: true
    end
  end
end