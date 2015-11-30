class AddUserIdToNgo < ActiveRecord::Migration
  def change
  	add_column :ngos, :user_id, :integer
  end
end
