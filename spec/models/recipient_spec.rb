require 'rails_helper'

RSpec.describe Recipient, type: :model do
  let(:recipient) { create(:recipient) }

  it "should set unique survey_token" do
    original_token = recipient.survey_token
    expect(original_token).to be_present
    recipient.update(email: "adifferent@email.com")
    expect(recipient.survey_token).not_to eql original_token
  end

  describe "#status" do
    let(:recipient) { create(:recipient, sent_survey_at: sent_survey_at, completed_survey_at: completed_survey_at) }

    subject { recipient.status }

    context "unsent" do
      let(:sent_survey_at) { nil }
      let(:completed_survey_at) { nil }
      it { is_expected.to eql :unsent }
    end

    context "sent" do
      let(:sent_survey_at) { Time.zone.now }
      let(:completed_survey_at) { nil }
      it { is_expected.to eql :sent }
    end

    context "completed" do
      let(:sent_survey_at) { 1.day.ago }
      let(:completed_survey_at) { Time.zone.now }
      it { is_expected.to eql :completed }
    end
  end

  describe "#greeting" do
    subject { recipient.greeting }

    context "with first_name" do
      before { recipient.first_name = "Brittany" }
      it { is_expected.to eql "Hi Brittany" }
    end

    context "without first_name" do
      before { recipient.first_name = nil }
      it { is_expected.to eql "Hi there" }
    end
  end
end
