require 'rails_helper'

RSpec.feature "SendBatchOfSurveys", type: :feature, js: true do
  let(:user) { create(:user) }
  let!(:product) { create(:product, user: user) }
  let!(:recipients) { create_list(:recipient, 10, product: product) }

  before do
    sign_in user
    visit recipients_path
  end

  it "lets user select multiple recipients and sends mailer" do
    expect(SendSurveyBatch).to receive(:call).with(recipients: [recipients[0].id, recipients[1].id, recipients[2].id])
    within("#recipients-table tbody") do
      rows = all("tr")
      rows.first(3).each do |row|
        within(row) { check("send_survey_ids[]") }
      end
    end
    click_on "Send survey batch"
    expect(page).to have_content "Your surveys will be sent shortly!"
  end
end
