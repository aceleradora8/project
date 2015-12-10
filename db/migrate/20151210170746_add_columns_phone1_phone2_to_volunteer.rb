class AddColumnsPhone1Phone2ToVolunteer < ActiveRecord::Migration
  def change
    add_column :volunteers, :phone1, :string
    add_column :volunteers, :phone2, :string
  end
end
