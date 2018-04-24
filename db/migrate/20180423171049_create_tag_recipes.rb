class CreateTagRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_recipes do |t|
      t.references :recipe, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
