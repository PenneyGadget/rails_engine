require 'rails_helper'

RSpec.describe Api::V1::InvoiceFinderController, type: :controller do

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice with specified status" do
      invoices = create_list(:invoice, 3)

      get :show, status: invoices.first.status, format: :json

      expect(json_response["status"]).to eq(invoices.first.status)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice with specified customer id" do
      invoices = create_list(:invoice, 3)

      get :show, customer_id: invoices.first.customer_id, format: :json

      expect(json_response["customer_id"]).to eq(invoices.first.customer_id)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice with specified merchant id" do
      invoices = create_list(:invoice, 3)

      get :show, merchant_id: invoices.last.merchant_id, format: :json
      expect(json_response["merchant_id"]).to eq(invoices.last.merchant_id)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice with specified created at time" do
      invoices = create_list(:invoice, 3)

      get :show, created_at: invoices.first.created_at, format: :json

      expect(json_response["created_at"]).to eq("2016-02-23T00:00:00.000Z")
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice with specified updated at time" do
      invoices = create_list(:invoice, 3)

      get :show, updated_at: invoices.last.updated_at, format: :json

      expect(json_response["updated_at"]).to eq("2016-02-23T00:00:00.000Z")
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all invoices with specified status" do
      Invoice.create(status: "shipped")
      Invoice.create(status: "shipped")
      Invoice.create(status: "cancelled")

      get :index, status: "cancelled", format: :json

      expect(json_response.count).to eq(1)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
