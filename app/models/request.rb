class Request < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  has_one :review, dependent: :destroy
end
