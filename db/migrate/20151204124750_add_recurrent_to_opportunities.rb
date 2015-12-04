class AddRecurrentToOpportunities < ActiveRecord::Migration
  def change
  	add_column :opportunities, :recurrent, :boolean
  end
end
