class AddContactEmailToNgo < ActiveRecord::Migration
  def change
    add_column :ngos, :contact_email, :string
  end
end
