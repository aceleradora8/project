class DeleteDatesFromNgo < ActiveRecord::Migration
  def change
    remove_column :opportunities, :start_date
    remove_column :opportunities, :finish_date
  end
end