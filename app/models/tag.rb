class Tag < ApplicationRecord
  has_many :tag_recipes
  validates :name, presence: true, uniqueness: true
end
