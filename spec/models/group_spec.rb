require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { create(:user) } # Use FactoryBot to create a user
  let(:group) { create(:group, user: user) } # Use FactoryBot to create a group with a user association
# subject {Group.new(user:, name: "category1", icon:  "kndsfknffdfndfdkndf")}
# before{subject.save}
  it 'is valid with valid attributes' do
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'is not valid with a name that already exists' do
  group.save
    group2 = build(:group, user: user) # Use build to create a new group without saving it
    expect(group2).to_not be_valid
  end

  it 'is not valid without an icon' do
    group.icon = nil
    expect(group).to_not be_valid
  end

  it 'is not valid without a user' do
    group.user = nil
    expect(group).to_not be_valid
  end
end
