FactoryBot.define do
  factory :user do
    name { "Example User" }
    email { "user@example.com" }
    password { "hogefuga" }
    password_confirmation { "hogefuga" }
  end
end
