FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email
    password "testing123"
    password_confirmation "testing123"
  end
end
