class Minitask < ApplicationRecord
  # Association
  has_many  :task_minitasks
  has_many  :task,  through: :task_minitasks
  has_one   :timer,                          dependent: :destroy

end
