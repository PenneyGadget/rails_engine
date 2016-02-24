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

    it "returns transaction with specified created at time" do
      transactions = create_list(:transaction, 3)

      get :show, created_at: transactions.first.created_at, format: :json

      expect(json_response["created_at"]).to eq("2016-02-23T00:00:00.000Z")
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns transaction with specified updated at time" do
      transactions = create_list(:transaction, 3)

      get :show, updated_at: transactions.last.updated_at, format: :json

      expect(json_response["updated_at"]).to eq("2016-02-23T00:00:00.000Z")
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all transactions with specified credit card" do
      Transaction.create(credit_card_number: "4536748574635648")
      Transaction.create(credit_card_number: "4536748574635648")
      Transaction.create(credit_card_number: "4637889944637284")

      get :index, credit_card_number: "4536748574635648", format: :json

      expect(json_response.count).to eq(2)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all transactions with specified result" do
      Transaction.create(result: "failed")
      Transaction.create(result: "success")
      Transaction.create(result: "success")

      get :index, result: "failed", format: :json

      expect(json_response.count).to eq(1)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
