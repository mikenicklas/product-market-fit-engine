FactoryBot.define do
  factory :enrichment do
    data '{"fullName": "John Smith",
      "ageRange": "23-33",
      "gender": "Male",
      "location": "Baltimore, Maryland, United States",
      "title": "Software Engineer",
      "organization": "XYZ Corp",
      "twitter": "https://twitter.com/johnsmith",
      "linkedin": "https://www.linkedin.com/in/john-smith-23ab6931",
      "facebook": "https://www.facebook.com/john.smith"}'

    recipient
    product
  end
end
