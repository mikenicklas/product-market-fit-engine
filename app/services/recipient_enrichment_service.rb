require 'fullcontact'

class RecipientEnrichmentService
  attr_reader :recipient

  delegate :product, to: :recipient

  def self.call(recipient)
    new(recipient).call
  end

  def initialize(recipient)
    @recipient = recipient
  end

  def call
    person = FullContact.person(email: recipient.email)
    recipient.create_enrichment(product_id: product.id, data: person.to_json)
  end

end
