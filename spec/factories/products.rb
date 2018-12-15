FactoryBot.define do
  factory :product do
    logo_url "https://s3.something.com/bucket/your_app.png"
    name "YourApp"
    site_url "https://yourapp.com"
    public_contact_email "contact@yourapp.com"

    user
  end
end
