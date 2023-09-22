# spec/factories/entities.rb
FactoryBot.define do
  factory :entity do
    association :author, factory: :user
    sequence(:name) { |n| "Entity #{n}" }
    amount { 5 }
  end
end
