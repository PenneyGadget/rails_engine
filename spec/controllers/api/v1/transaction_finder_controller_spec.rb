require 'rails_helper'

RSpec.describe Api::V1::TransactionFinderController, type: :controller do

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns transaction with specified credit_card_number" do
      transactions = create_list(:transaction, 3)

      get :show, credit_card_number: transactions.last.credit_card_number, format: :json

      expect(json_response["credit_card_number"]).to eq(transactions.last.credit_card_number)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns transaction with specified result" do
      transactions = create_list(:transaction, 3)

      get :show, result: transactions.last.result, format: :json

      expect(json_response["result"]).to eq(transactions.last.result)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns transaction with specified invoice_id" do
      transactions = create_list(:transaction, 3)

      get :show, invoice_id: transactions.last.invoice_id, format: :json

      expect(json_response["invoice_id"]).to eq(transactions.last.invoice_id)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    xit "returns transaction with specified created at time" do
      transactions = create_list(:transaction, 3)

      get :show, created_at: transactions.first.created_at, format: :json

      expect(json_response["created_at"]).to eq(transactions.first.created_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    xit "returns transaction with specified updated at time" do
      transactions = create_list(:transaction, 3)

      get :show, updated_at: transactions.last.updated_at, format: :json

      expect(json_response["updated_at"]).to eq(transactions.last.updated_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
