require 'rails_helper'

RSpec.describe "Rails", type: :request do

  describe "GET /db:migrate" do
    it "returns http success" do
      get "/rails/db:migrate"
      expect(response).to have_http_status(:success)
    end
  end

end
