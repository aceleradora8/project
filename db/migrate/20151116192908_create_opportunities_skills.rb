class CreateOpportunitiesSkills < ActiveRecord::Migration
  def change
    create_table :opportunities_skills do |t|
      t.integer :opportunity_id
      t.integer :skill_id
	  t.references :opportunity, index: true
	  t.references :skill, index: true
    end
	add_foreign_key :opportunities_skills, :skills
   add_foreign_key :opportunities_skills, :opportunities	
  end

end
