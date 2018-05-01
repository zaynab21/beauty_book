class IngredientRecipe < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  validates :quantity, presence: true, numericality: { only_integer: true }
end
