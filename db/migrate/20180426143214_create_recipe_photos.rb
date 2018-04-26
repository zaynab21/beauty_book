class CreateRecipePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_photos do |t|
      t.string :photo
      t.references :recipe

      t.timestamps
    end
  end
end
