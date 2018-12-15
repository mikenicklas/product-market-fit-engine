require "rails_helper"

describe RecipientMailer do
  let(:recipient) { create(:recipient) }
  let(:mailer) { }

  describe "#survey_email" do
    let(:email) { described_class.with(recipient: recipient).survey_email.deliver_now }

    it "should send correct email", aggregate_failures: true do
      expect(email.from.first).to eql recipient.product.public_contact_email
      expect(email.to.first).to eql recipient.email
      expect(email.subject).to eql "Quick question about #{recipient.product.name}"
    end
  end
end
