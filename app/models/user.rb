class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recipes
  validates :username, presence: true, uniqueness: true
  validates :age, numericality: { only_integer: true }, allow_blank: true
  # validates :skin_type, inclusion:
  # validates :skin_type, inclusion:

end
