class DeleteCauseIdFromOpportunities < ActiveRecord::Migration
  def change
  	remove_column :opportunities, :causes_id
  	remove_column :opportunities, :cause_id
  end
end
