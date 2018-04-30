class CreateIngredientRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredient_recipes do |t|
      t.integer :quantity
      t.references :ingredient, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
