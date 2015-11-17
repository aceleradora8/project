class CreateForeignKeys < ActiveRecord::Migration
  def change
  	add_foreign_key :causes_ngos, :ngos
  	add_foreign_key :causes_ngos, :causes
  	add_foreign_key :opportunities, :ngos
  	add_foreign_key :opportunities, :addresses
  	add_foreign_key :opportunities, :causes
  	add_foreign_key :opportunities_skills, :opportunities
  	add_foreign_key :opportunities_skills, :skills  	
  	add_foreign_key :phones, :ngos
    add_foreign_key :ngos, :addresses
  end
end
