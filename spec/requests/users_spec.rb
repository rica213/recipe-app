require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /public recipe' do
    it 'returns http success' do
      get public_recipes_path
      expect(response).to have_http_status(:success)
    end

    it 'should render index page for public recipe' do
      get public_recipes_path
      expect(response).to render_template('recipes/public_recipes')
    end
  end

  describe 'GET /sign in' do
    it 'should render sign in page' do
      get new_user_session_path
      expect(response).to have_http_status(:success)
    end
  end
end
