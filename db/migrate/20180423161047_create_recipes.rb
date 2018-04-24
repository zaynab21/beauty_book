class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.text :title
      t.text :effect
      t.time :time
      t.integer :difficulty
      t.integer :cost
      t.string :purpose
      t.text :description
      t.text :state, default: :pending
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
