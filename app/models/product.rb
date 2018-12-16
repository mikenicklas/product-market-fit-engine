class Product < ApplicationRecord
  belongs_to :user
  has_many :recipients
  has_many :survey_responses
  has_one :word_cloud
end
