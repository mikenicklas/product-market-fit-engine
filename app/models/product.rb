class Product < ApplicationRecord
  belongs_to :user
  has_many :recipients
  has_many :survey_responses, through: :recipient
end
