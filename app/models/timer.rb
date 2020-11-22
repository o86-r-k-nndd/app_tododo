class Timer < ApplicationRecord
  # Validation
  with_options presence: true do
    validates :time
  end

  # Association
  belongs_to :minitask
  
end
