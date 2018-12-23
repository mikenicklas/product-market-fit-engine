class Enrichment < ApplicationRecord
  validates :data, presence: true

  belongs_to :product
  belongs_to :recipient
end
