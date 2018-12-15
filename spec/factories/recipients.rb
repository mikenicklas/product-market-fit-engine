FactoryBot.define do
  factory :recipient do
    first_name "John"
    last_name "Smith"
    email "john.smith@gmail.com"
    custom_data nil
    sent_survey_at nil
    completed_survey_at nil

    product
  end
end
