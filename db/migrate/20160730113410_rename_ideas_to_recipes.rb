class RenameIdeasToRecipes < ActiveRecord::Migration
  def change
    rename_table :ideas, :recipes
  end
end
