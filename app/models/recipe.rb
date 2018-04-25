class Recipe < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :tag_recipes, dependent: :destroy
  has_many :tags, through: :tag_recipes
  validates_associated :tags
  validates :title, presence: true
  validates :state, presence:true
  #default value
  validates :effect, presence: true
  # validates :time, presence: true
  validates :difficulty, presence: true, numericality: { only_integer: true }
  validates :cost, presence: true, numericality: { only_integer: true }
  validates :purpose, presence: true
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
