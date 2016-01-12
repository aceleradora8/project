class AddSexOnVolunteer < ActiveRecord::Migration
  def change
  	add_column :volunteers, :sex, :string
  end
end
