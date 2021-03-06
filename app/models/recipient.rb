class Recipient < ApplicationRecord
  belongs_to :product
  has_many :survey_responses
  has_one :enrichment

  before_save :set_survey_token

  validates :email, uniqueness: { scope: :product_id }

  def status
    return :completed if completed?
    return :sent if sent?
    return :unsent
  end

  def unsent?
    !sent?
  end

  def sent?
    sent_survey_at.present?
  end

  def completed?
    sent_survey_at.present? && completed_survey_at.present?
  end

  def greeting
    if first_name.present?
      "Hi #{first_name}"
    else
      "Hi there"
    end
  end

  private

  def set_survey_token
    self.survey_token = GenerateSurveyToken.call(email: email, product_name: product.name)
  end

end
