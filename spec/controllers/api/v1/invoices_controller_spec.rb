require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all invoices in json format" do
      invoices = create_list(:invoice, 3)

      get :index, format: :json

      expect(json_response.first["id"]).to eq(invoices.first.id)
      expect(json_response.first["status"]).to eq(invoices.first.status)
      expect(json_response.last["customer_id"]).to eq(invoices.last.customer_id)
      expect(json_response.last["merchant_id"]).to eq(invoices.last.merchant_id)
      expect(json_response.count).to eq(3)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice with specified id in json" do
      invoice = create(:invoice)

      get :show, id: invoice.id, format: :json

      expect(json_response["id"]).to eq(invoice.id)
      expect(json_response["status"]).to eq(invoice.status)
      expect(json_response["customer_id"]).to eq(invoice.customer_id)
      expect(json_response["merchant_id"]).to eq(invoice.merchant_id)
      # expect(json_response["created_at"]).to eq(invoice.created_at)
      # expect(json_response["updated_at"]).to eq(invoice.updated_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
