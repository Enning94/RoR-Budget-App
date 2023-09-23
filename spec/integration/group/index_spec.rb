require 'rails_helper'

RSpec.describe 'Group Views #index', type: :system do
  before(:each) do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user_id: @user.id)
    sign_in(@user, scope: :user)
  end

  it 'displays list of categories' do
    visit user_groups_path(@user)
    sleep(5)
    expect(page).to have_content('TRANSACTIONS')
    expect(page).to have_content(@group.name)
  end

  it "can click on the 'Add a new category' button" do
    visit user_groups_path(@user)

    within('.container-set') do
      click_link 'add a new category'
    end
    sleep(5)
    expect(page).to have_current_path(new_user_group_path(@user))
  end
end
