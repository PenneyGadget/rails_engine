require "rails_helper"

RSpec.describe Api::V1::Items::MostRevenuesController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns the specified number of top items sold by revenue" do
      get :index, quantity: 3, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
