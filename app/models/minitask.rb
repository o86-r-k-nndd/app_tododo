class Minitask < ApplicationRecord
  # Validation
  validates :name, presence: true
  
  # Association
  has_many  :task_minitasks
  has_many  :task,  through: :task_minitasks
  has_one   :timer

end
