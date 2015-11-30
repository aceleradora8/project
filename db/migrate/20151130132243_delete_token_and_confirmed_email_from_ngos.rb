class DeleteTokenAndConfirmedEmailFromNgos < ActiveRecord::Migration
  def change
  	remove_column :ngos, :email_confirmed
  	remove_column :ngos, :confirm_token
  end
end
