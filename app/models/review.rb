class Review < ApplicationRecord
  belongs_to :request
  validates :instrument_stars, inclusion: { in: [1, 2, 3, 4, 5] }
end
