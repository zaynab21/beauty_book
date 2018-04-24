class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recipes
  validates_associated :recipes
  validates :email, confirmation: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  # validates :age, numericality: { only_integer: true }
  # validates :skin_type, inclusion:
  # validates :skin_type, inclusion:

end
