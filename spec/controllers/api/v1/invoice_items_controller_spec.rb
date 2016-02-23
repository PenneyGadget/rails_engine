require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all invoices in json format" do
      invoice_items = create_list(:invoice_item, 3)

      get :index, format: :json

      expect(json_response.first["quantity"]).to eq(invoice_items.first.quantity)
      expect(json_response.last["unit_price"]).to eq(invoice_items.last.unit_price)
      expect(json_response.count).to eq(3)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice item with specified id in json" do
      invoice_item = create(:invoice_item)

      get :show, id: invoice_item.id, format: :json

      expect(json_response["id"]).to eq(invoice_item.id)
      expect(json_response["quantity"]).to eq(invoice_item.quantity)
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price)
      expect(json_response["item_id"]).to eq(invoice_item.item_id)
      expect(json_response["invoice_id"]).to eq(invoice_item.invoice_id)
      # expect(json_response["created_at"]).to eq(invoice_invoice.created_at)
      # expect(json_response["updated_at"]).to eq(invoice_invoice.updated_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
