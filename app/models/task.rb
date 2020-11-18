class Task < ApplicationRecord
  # validation
  # validates :name, presence: true
  # association
  belongs_to :user
  has_many   :genres, through: :genre_tasks
end