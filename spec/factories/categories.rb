FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
    icon { 'default_icon.png' }
    association :user, factory: :user
  end
end
