FactoryBot.define do
  factory :transaction do
    amount { 10 }
    name { 'Jacket' }
    association :user, factory: :user
  end
end
