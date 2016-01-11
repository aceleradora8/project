class AddMissionOnOng < ActiveRecord::Migration
  def change
  	add_column :ngos, :mission, :text
  end
end
