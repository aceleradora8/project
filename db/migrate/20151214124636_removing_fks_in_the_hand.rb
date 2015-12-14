class RemovingFksInTheHand < ActiveRecord::Migration
  def change
    remove_foreign_key :ngos, :addresses
    remove_foreign_key :phones, :ngos
    remove_foreign_key :opportunities, :addresses
    remove_foreign_key :opportunities, :ngos
    remove_foreign_key :opportunities, :causes
    remove_foreign_key :opportunities_skills, :skills
    remove_foreign_key :opportunities_skills, :opportunities	
    remove_foreign_key :causes_ngos, :ngos
    remove_foreign_key :causes_ngos, :causes
  end
end
