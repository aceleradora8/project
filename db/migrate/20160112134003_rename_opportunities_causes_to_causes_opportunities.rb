class RenameOpportunitiesCausesToCausesOpportunities < ActiveRecord::Migration
  def change
  	rename_table :opportunities_causes, :causes_opportunities
  end
end
