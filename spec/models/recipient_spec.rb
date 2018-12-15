require 'rails_helper'

RSpec.describe Recipient, type: :model do
  let(:recipient) { create(:recipient) }

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
end
