class RecipientAddedWorker
  include Sidekiq::Worker

  def perform(recipient_id)
    recipient = Recipient.find(recipient_id)
    RecipientEnrichmentService.call(recipient)
  end
end
