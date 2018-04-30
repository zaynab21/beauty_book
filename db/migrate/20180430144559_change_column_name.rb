class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipes, :effect, :feature
    rename_column :recipes, :purpose, :category
  end
end
