class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :cep
      t.string :complement
      t.string :state
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
