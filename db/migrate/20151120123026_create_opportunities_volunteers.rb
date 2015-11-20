class CreateOpportunitiesVolunteers < ActiveRecord::Migration
  def change
    create_table :opportunities_volunteers do |t|
    	t.integer :opportunity_id
    	t.integer :volunteer_id
    	t.references :opportunity, index: true
    	t.references :volunteer, index: true
    end

    add_foreign_key :opportunities_volunteers, :volunteers
    add_foreign_key :opportunities_volunteers, :opportunities
  end
end

