class Genre < ApplicationRecord
  # validation
  validates :name, presense: true
  # association
  belongs_to :user
end
