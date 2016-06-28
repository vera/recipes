class AddIndexToIdeas < ActiveRecord::Migration
  def change
    add_index :ideas, :name, :unique => true
  end
end
