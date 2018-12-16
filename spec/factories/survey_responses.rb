FactoryBot.define do
  factory :survey_response do
    disappointment 0
    ideal_customer "someone who doesnt have a lot of time"
    main_benefits "it is easy to use and its cheap"
    recommended_improvements "I think it should be faster"

    recipient
    product
  end
end
