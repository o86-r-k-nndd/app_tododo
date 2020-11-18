class Task < ApplicationRecord
  # validation
  validates :name, presence: true
  # association
  has_many   :genres, through: :genre_tasks
end
