class Instrument < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  has_many :request

  include PgSearch::Model
  pg_search_scope :basic_search,
  against: [ :name, :description ],
  using: {
    tsearch: { prefix: true }
  }

end
