class Timer < ApplicationRecord
  # Validation
  validates :time, presence: true

  # Association
  belongs_to :minitask
  
end