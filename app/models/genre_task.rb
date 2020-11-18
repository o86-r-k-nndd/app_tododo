class GenreTask < ApplicationRecord
  belongs_to :genre
  belongs_to :task
end