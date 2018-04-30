class AddApplicationTimeToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :application_time_min, :integer
  end
end
