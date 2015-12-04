class AddPrivacyToNgo < ActiveRecord::Migration
  def change
    add_column :ngos, :privacy, :boolean
  end
end
