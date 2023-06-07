require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /shopping_list" do
    it "returns http success" do
      get "/users/shopping_list"
      expect(response).to have_http_status(:success)
    end
  end

end
