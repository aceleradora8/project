class DeleteEmailFromNgos < ActiveRecord::Migration
  def change
  	remove_column :ngos, :email
  end
end
