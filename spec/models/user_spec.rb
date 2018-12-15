require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "#oboarded?" do
    subject { user.onboarded? }

    context "when user setup product" do
      let!(:product) { create(:product, user: user) }
      it { is_expected.to eql true }
    end

    context "when user hasn't setup product" do
      before { allow(user).to receive(:product).and_return nil }
      it { is_expected.to eql false }
    end
  end
end
