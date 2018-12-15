class SendSurveyBatch
  def self.call(recipients:)
    recipients.each do |recipient_id|
      recipient = Recipient.find(recipient_id)
      process_mailer_for(recipient)
    end
  end

  def self.process_mailer_for(recipient)
    return if recipient.sent?
    RecipientMailer.with(recipient: recipient).survey_email.deliver_now
    recipient.update(sent_survey_at: Time.zone.now)
  end
end
