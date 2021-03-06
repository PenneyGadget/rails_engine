require "rails_helper"

RSpec.describe Api::V1::Items::MerchantsController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

      it "returns the merchant associated with an item" do
        item = create(:item)
        merchant = item.merchant

        get :show, item_id: item.id, format: :json

        expect(response).to be_success
        expect(response.status).to eq(200)

        expect(json_response["id"]).to eq(merchant.id)
        expect(json_response["name"]).to eq(merchant.name)
    end
  end
end
