require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all transactions in json format" do
      transactions = create_list(:transaction, 3)

      get :index, format: :json

      expect(json_response.first["id"]).to eq(transactions.first.id)
      expect(json_response.last["credit_card_number"]).to eq(transactions.last.credit_card_number)
      expect(json_response.first["result"]).to eq(transactions.first.result)
      expect(json_response.last["invoice_id"]).to eq(transactions.last.invoice_id)
      expect(json_response.count).to eq(3)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns transaction with specified id in json" do
      transaction = create(:transaction)

      get :show, id: transaction.id, format: :json

      expect(json_response["id"]).to eq(transaction.id)
      expect(json_response["credit_card_number"]).to eq(transaction.credit_card_number)
      expect(json_response["result"]).to eq(transaction.result)
      expect(json_response["invoice_id"]).to eq(transaction.invoice_id)
      # expect(json_response["created_at"]).to eq(transaction.created_at)
      # expect(json_response["updated_at"]).to eq(transaction.updated_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
