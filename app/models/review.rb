class Review < ApplicationRecord
  belongs_to :recipe

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: [0,1,2,3,4,5], message: "Rating is 0 to 5"}
end
