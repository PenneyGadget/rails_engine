require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemFinderController, type: :controller do

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice item with specified quantity" do
      invoice_items = create_list(:invoice_item, 3)

      get :show, quantity: invoice_items.first.quantity, format: :json

      expect(json_response["quantity"]).to eq(invoice_items.first.quantity)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice item with specified unit price" do
      invoice_items = create_list(:invoice_item, 3)

      get :show, unit_price: invoice_items.first.unit_price, format: :json

      expect(json_response["unit_price"]).to eq(invoice_items.first.unit_price)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice item with specified item id" do
      invoice_items = create_list(:invoice_item, 3)

      get :show, item_id: invoice_items.last.item_id, format: :json
      expect(json_response["item_id"]).to eq(invoice_items.last.item_id)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice item with specified invoice id" do
      invoice_items = create_list(:invoice_item, 3)

      get :show, invoice_id: invoice_items.first.invoice_id, format: :json

      expect(json_response["invoice_id"]).to eq(invoice_items.first.invoice_id)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    xit "returns invoice item with specified created at time" do
      invoice_items = create_list(:invoice_item, 3)

      get :show, created_at: invoice_items.first.created_at, format: :json

      expect(json_response["created_at"]).to eq(invoice_items.first.created_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    xit "returns invoice item with specified updated at time" do
      invoice_items = create_list(:invoice_item, 3)

      get :show, updated_at: invoice_items.last.updated_at, format: :json

      expect(json_response["updated_at"]).to eq(invoice_items.last.updated_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
