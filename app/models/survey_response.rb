class SurveyResponse < ApplicationRecord
  belongs_to :recipient

  delegate :product, to: :recipient
end
