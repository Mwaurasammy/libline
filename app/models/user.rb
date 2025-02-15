class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :borrowings
  has_many :books, through: :borrowings
  validates :email, presence: true, uniqueness: true  # FIXED: Corrected "emails" to "email"
  validates :name, presence: true
end
