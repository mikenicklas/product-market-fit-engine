class Recipient < ApplicationRecord
  belongs_to :product

  def status
    return :completed if completed?
    return :sent if sent?
    return :unsent
  end

  def sent?
    sent_survey_at.present?
  end

  def completed?
    sent_survey_at.present? && completed_survey_at.present?
  end
end
