class RecipePhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :recipe
end
