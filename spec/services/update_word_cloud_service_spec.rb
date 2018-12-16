require "rails_helper"

describe UpdateWordCloudService do
  let(:product) { create(:product) }
  let(:survey_response) { create(:survey_response, ideal_customer: ideal_customer, product: product) }

  describe "#call" do
    let(:ideal_customer) { "someone who doesn't have a lot of time. an executive" }

    before { described_class.call(product: product) }
    subject { product.word_cloud }

    it { is_expected.to be_truthy }
  end
end
