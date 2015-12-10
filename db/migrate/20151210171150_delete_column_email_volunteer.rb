class DeleteColumnEmailVolunteer < ActiveRecord::Migration
  def change
    remove_column :volunteers, :email
  end
end
