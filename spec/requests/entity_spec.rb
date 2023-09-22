require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  before do
    @user = FactoryBot.create(:user)
    sign_in @user
    @group = FactoryBot.create(:group, user_id: @user.id)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get user_group_entities_path(user_id: @user.id, group_id: @group.id)
      expect(response).to have_http_status(:success)
    end

    it 'correct template is rendered' do
      get user_group_entities_path(user_id: @user.id, group_id: @group.id)
      expect(response).to render_template(:index)
    end
  end
end
