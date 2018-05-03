class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recipes
  has_many :reviews
  mount_uploader :photo, PhotoUploader
  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true
  validates :age, numericality: { only_integer: true }, allow_blank: true
end
