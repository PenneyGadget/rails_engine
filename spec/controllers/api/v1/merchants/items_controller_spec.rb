require "rails_helper"

RSpec.describe Api::V1::Merchants::ItemsController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all items associated with a merchant" do
      merchant = create(:merchant)
      items = create_list(:item, 2)
      merchant.items << items

      get :index, merchant_id: merchant.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response.count).to eq(2)

      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.first["name"]).to eq(items.first.name)
      expect(json_response.last["id"]).to eq(items.last.id)
      expect(json_response.last["name"]).to eq(items.last.name)

    end
  end
end
