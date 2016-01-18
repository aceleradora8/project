class AddBirthDateOnVolunteer < ActiveRecord::Migration
  def change
  	add_column :volunteers, :birth_date, :date, null: false
  end
end
