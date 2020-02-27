class Instrument < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :requests
end
