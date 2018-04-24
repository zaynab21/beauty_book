class Recipe < ApplicationRecord
  belongs_to :user
  has_many :tag_recipes, dependent: :destroy
  has_many :tags, through: :tag_recipes
  validates_associated :tags
  validates :title, presence: true
  validates :state, presence:true
  #default value
  validates :effect, presence: true
  # validates :time, presence: true
  validates :difficulty, presence: true
  validates :cost, presence: true
  validates :purpose, presence: true
  #inclusion
  validates :description, presence: true
end
