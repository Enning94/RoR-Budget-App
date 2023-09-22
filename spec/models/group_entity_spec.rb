require 'rails_helper'

RSpec.describe GroupEntity, type: :model do
 
  describe 'associations' do
    it 'belongs to recipe' do
      association = described_class.reflect_on_association(:group)
      expect(association.macro).to eq(:belongs_to)
    end
    it 'belongs to food' do
      association = described_class.reflect_on_association(:entity)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
