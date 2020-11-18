class Genre < ApplicationRecord
  # validation
  validates :name, presence: true
  # association
  belongs_to :user
end
