FactoryBot.define do
  factory :user do
    name { 'John' }
    sequence(:email) { |n| "john#{n}@example.com" }
    password { 'password' }
  end
end
