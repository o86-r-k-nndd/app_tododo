class User < ApplicationRecord
  # devise options
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validation
  validates :name, presence: true

  # association
  has_many :genres
end
