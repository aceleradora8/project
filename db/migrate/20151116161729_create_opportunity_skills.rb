class CreateOpportunitySkills < ActiveRecord::Migration
  def change
    create_table :opportunity_skills do |t|
      t.integer :opportunity_id
      t.integer :skill_id

      t.timestamps null: false
    end
  end
end
