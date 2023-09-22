# spec/factories/expenses.rb
FactoryBot.define do
  factory :expense do
    association :author, factory: :user
    sequence(:name) { |n| "Expense#{n}" }
    amount { 5 }
  end
end
