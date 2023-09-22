# spec/factories/entities.rb
FactoryBot.define do
    factory :entity do
      association :author, factory: :user
      name { 'Rice' }
      amount { 5 }
    end
  end
  