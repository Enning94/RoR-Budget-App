require 'rails_helper'

RSpec.describe User, type: :model do

  user = User.new(name: 'John Doe', email: 'local@host2', password: '123456', password_confirmation: '123456')
  before { user.save }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with a password shorter than 6 characters' do
    user.name = 'John Doe'
    user.password = '12345'
    user.password_confirmation = '12345'
    expect(user).to_not be_valid
  end

  it 'is valid with a password of 6 characters or more' do
    user.password = '1234569'
    user.password_confirmation = '1234569'
    expect(user).to be_valid
  end

  it 'is not valid with a password confirmation that does not match' do
    user.password = '1234569'
    user.password_confirmation = '1234567'
    expect(user).to_not be_valid
  end

  it 'is valid with a password confirmation that matches' do
    user.password = '1234569'
    user.password_confirmation = '1234569'
    expect(user).to be_valid
  end

  end
