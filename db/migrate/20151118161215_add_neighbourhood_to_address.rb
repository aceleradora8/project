class AddNeighbourhoodToAddress < ActiveRecord::Migration
  def change
  		add_column :addresses, :neighbourhood, :string
  end
end
