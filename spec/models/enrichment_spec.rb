require 'rails_helper'

RSpec.describe Enrichment, type: :model do
  let(:enrichment) { create(:enrichment) }

  it "is invalid without data" do
    enrichment.data = nil
    expect(enrichment).to be_invalid
  end
  
end
