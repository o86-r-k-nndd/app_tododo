class Timer < ApplicationRecord
  # Validation
  with_options presence: true do
    validates :time
    validates :day_id, numericality: { other_than: 1 }
  end
  # Association
  belongs_to :minitask
end
