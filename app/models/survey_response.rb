class SurveyResponse < ApplicationRecord
  belongs_to :recipient
  belongs_to :product

  enum disappointment: { very_disappointed: 0, semi_disappointed: 1, not_disappointed: 2}
end
