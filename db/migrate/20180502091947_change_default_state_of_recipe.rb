class ChangeDefaultStateOfRecipe < ActiveRecord::Migration[5.1]
  def change
  	change_column :recipes, :state, :string, default: "private"
  end
end
