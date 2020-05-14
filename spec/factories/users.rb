FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}"}
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'secret_password' }
    password_confirmation { password }
  end
end
