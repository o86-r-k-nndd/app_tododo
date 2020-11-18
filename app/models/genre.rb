class Genre < ApplicationRecord
  # validation
  validates :name, presence: true
  # association
  belongs_to :user
  has_many   :tasks, through: :genre_tasks
end