require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  before do
    @user = FactoryBot.create(:user)
    sign_in @user
    @group = FactoryBot.create(:group, user_id: @user.id)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get user_groups_path(@user)

      expect(response).to have_http_status(:success)
    end
    it 'correct template is rendered' do
      get user_groups_path(@user)

      expect(response).to render_template(:index)
    end

    it 'the response body includes correct placeholder text' do
      get user_groups_path(@user)

      expect(response.body).to include('add a new category')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get user_group_path(user_id: @user.id, id: @group.id)
      expect(response).to have_http_status(:success)
    end
    it 'correct template is rendered' do
      get user_group_path(user_id: @user.id, id: @group.id)

      expect(response).to render_template(:show)
    end

    it 'the response body includes correct placeholder text' do
      get user_group_path(user_id: @user.id, id: @group.id)

      expect(response.body).to include('add a new transaction')
    end
  end
end
