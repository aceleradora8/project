class UpdatePhonesVolunteer < ActiveRecord::Migration
  def change
  	remove_column :volunteers, :phone
  end
end
