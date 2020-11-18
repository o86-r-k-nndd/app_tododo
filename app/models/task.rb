class Task < ApplicationRecord
  # validation
  validates :name, presence: true
  # association
  has_many  :genre_tasks
  has_many  :task_minitasks
  has_many  :genres, through: :genre_tasks
  has_many  :minitasks, through: :genre_tasks
end