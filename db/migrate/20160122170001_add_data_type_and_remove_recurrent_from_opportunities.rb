class AddDataTypeAndRemoveRecurrentFromOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :data_type, :string
    remove_column :opportunities, :recurrent
  end
end
