require 'rails_helper'

RSpec.feature "SurveyResponses", type: :feature do
  let(:recipient) { create(:recipient) }

  it "can view survey and create responses" do
    visit new_survey_response_path(token: recipient.survey_token)
    choose "Very disappointed"
    fill_in "survey_response[ideal_customer]", with: "Someone like me"
    fill_in "survey_response[main_benefits]", with: "I love how fast it is"
    fill_in "survey_response[recommended_improvements]", with: "I wish there were more integrations"
    click_on "Submit survey"
    expect(page).to have_content "Thanks so much for filling out our survey!"
  end
end
