class Recipe < ApplicationRecord
  include PgSearch
  has_many :recipe_photos
  accepts_nested_attributes_for :recipe_photos
  belongs_to :user
  has_many :tag_recipes, dependent: :destroy
  has_many :tags, through: :tag_recipes
  has_many :ingredients, through: :ingredient_recipes
  has_many :reviews, dependent: :destroy
  validates_associated :tags
  validates :title, presence: true
  validates :state, presence:true
  validates :feature, presence: true
  validates :difficulty, presence: true, numericality: { only_integer: true }
  validates :cost, presence: true, numericality: { only_integer: true }
  validates :category, presence: true
  #inclusion
  validates :description, presence: true

  pg_search_scope :global_search,
    against: [ :title, :effect, :difficulty, :cost, :purpose, :description ],
    associated_against: {
      tags: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
