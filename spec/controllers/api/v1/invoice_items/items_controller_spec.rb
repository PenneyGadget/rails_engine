require "rails_helper"

RSpec.describe Api::V1::InvoiceItems::ItemsController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns item associated with a particular invoice item" do
      invoice_item = create(:invoice_item)
      item = invoice_item.item

      get :show, invoice_item_id: invoice_item.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["name"]).to eq(item.name)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price)
    end
  end
end
