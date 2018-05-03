class RemoveFeatureFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :feature, :text
  end
end
