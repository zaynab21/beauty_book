class RemoveTimeFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :time, :time
  end
end
