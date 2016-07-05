class AddForeignKeyToIdeas < ActiveRecord::Migration
  def change
    add_foreign_key :ideas, :categories
  end
end
