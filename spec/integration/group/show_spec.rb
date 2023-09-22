require 'rails_helper'

RSpec.describe 'Group Views #show', type: :system do
  before(:each) do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user_id: @user.id)
    sign_in(@user, scope: :user)
  end

  it 'displays details of categories' do
    visit user_group_path(user_id: @user.id, id: @group.id)

    expect(page).to have_content('DETAILS')
    expect(page).to have_content(@group.name)
    @group.entities.each do |entity|
      expect(page).to have_content(entity.name)
      expect(page).to have_content(entity.created_at.strftime('%d %b %Y at %I:%M%P'))
    end
  end

  it "can click on the 'Add a new transaction' button" do
    visit user_group_path(user_id: @user.id, id: @group.id)
    within('.transaction-set') do
      click_link 'add a new transaction'
    end
    expect(page).to have_current_path(new_user_group_entity_path(user_id: @user.id, group_id: @group.id))
  end
end
