class Ingredient < ApplicationRecord
  has_many :ingredient_recipes
  validates :name, presence: true
end
