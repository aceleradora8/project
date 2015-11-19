class AddEmailToNgo < ActiveRecord::Migration
  def change
    add_column :ngos, :email, :string, null: false
  end
end
