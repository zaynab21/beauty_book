class AddPreparationTimeToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :preparation_time_min, :integer
  end
end
