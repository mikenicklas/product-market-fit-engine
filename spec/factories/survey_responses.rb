FactoryBot.define do
  factory :survey_response do
    recipient_id { 1 }
    product_id { 1 }
    disappointment { 1 }
    ideal_customer { 1 }
    main_benefits { "MyText" }
    recommended_improvements { "MyText" }
  end
end
