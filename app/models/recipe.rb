class Recipe < ApplicationRecord
  include PgSearch
  has_many :recipe_photos, dependent: :destroy
  accepts_nested_attributes_for :recipe_photos
  belongs_to :user
  has_many :tag_recipes, dependent: :destroy
  has_many :tags, through: :tag_recipes
  has_many :ingredient_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredient_recipes
  has_many :reviews, dependent: :destroy
  validates_associated :tags
  validates :title, presence: true
  validates :state, presence:true
  #inclusion
  pg_search_scope :global_search,
    against: [ :title, :difficulty, :cost, :category, :description ],
    associated_against: {
      tags: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
