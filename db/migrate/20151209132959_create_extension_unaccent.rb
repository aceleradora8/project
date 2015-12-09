class CreateExtensionUnaccent < ActiveRecord::Migration
  def up
    execute "create extension unaccent"
  end
end
