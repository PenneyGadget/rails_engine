RSpec.describe Api::V1::Merchants::RevenuesController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns the total revenue for a merchant across all transactions" do
      # items = create_list(:item, 2)
      # merchant = create(:merchant)
      # merchant.items << items

      get :show, merchant_id: merchant.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
