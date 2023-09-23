require 'rails_helper'

RSpec.describe GroupExpense, type: :model do
  describe 'associations' do
    it 'belongs to group' do
      association = described_class.reflect_on_association(:group)
      expect(association.macro).to eq(:belongs_to)
    end
    it 'belongs to expense' do
      association = described_class.reflect_on_association(:expense)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
