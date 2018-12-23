class Product < ApplicationRecord
  belongs_to :user
  has_many :recipients
  has_many :survey_responses
  has_many :enrichments
  has_one :word_cloud

  ENRICHMENTS_PER_MONTH = 25
end
