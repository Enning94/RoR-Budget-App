require 'rails_helper'

RSpec.describe Entity, type: :model do
  user = User.new(name: 'John Doe', email: 'local@host', password: '123456', password_confirmation: '123456')
  user.save

  group = Group.new(user_id: user.id, name: 'Food Items', icon: 'https://images.unsplash.com/photo-1505691723518-36a5ac3be353?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80')
  group.save

  entity = Entity.new(author_id: user.id, name: 'Rice', amount: 5)
  entity.save

  it 'is not valid without a name' do
    entity.name = nil
    expect(entity).to_not be_valid
  end

  it 'is not valid with name that already exists' do
    entity2 = Entity.create(name: 'Rice', amount: 3)
    expect(entity2).to_not be_valid
  end

  it 'is not valid without a amount' do
    entity.amount = nil
    expect(entity).to_not be_valid
  end

  it 'is not valid without a user' do
    entity.author_id = nil
    expect(entity).to_not be_valid
  end

  it 'is valid with a name, amount, and a user' do
    user = User.create(email: 'tamara@gmail.com', password: '123456')
    entity = Entity.new(name: 'test spending', amount: 10.50, author: user)
    expect(entity).to be_valid
  end
end
