class AddEmailConfirmationToNgo < ActiveRecord::Migration
  def change
    add_column :ngos, :email_confirmed, :boolean, :default => false
    add_column :ngos, :confirm_token, :string
  end
end
