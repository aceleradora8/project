class CreateExtensionUnaccent < ActiveRecord::Migration
  def up
    execute "create extension if not exists unaccent"
  end
end
