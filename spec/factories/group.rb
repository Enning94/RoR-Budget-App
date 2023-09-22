# spec/factories/groups.rb
FactoryBot.define do
  factory :group do
    user
    name { 'Food Items1' }
    icon { 'https://images.unsplash.com/photo-1505691723518-36a5ac3be353?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80' }
  end
end
