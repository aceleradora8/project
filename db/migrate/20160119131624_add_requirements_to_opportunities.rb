class AddRequirementsToOpportunities < ActiveRecord::Migration
  def change
  	add_column :opportunities, :requirements, :text
  end
end
