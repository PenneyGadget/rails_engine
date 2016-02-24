require 'rails_helper'

RSpec.describe Api::V1::MerchantFinderController, type: :controller do

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns merchant with specified name" do
      merchants = create_list(:merchant, 3)

      get :show, name: merchants.last.name, format: :json

      expect(json_response["name"]).to eq(merchants.last.name)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    xit "returns merchant with specified created at time" do
      merchants = create_list(:merchant, 3)

      get :show, created_at: merchants.first.created_at, format: :json

      expect(json_response["created_at"]).to eq(merchants.first.created_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    xit "returns merchant with specified updated at time" do
      merchants = create_list(:merchant, 3)

      get :show, updated_at: merchants.last.updated_at, format: :json

      expect(json_response["updated_at"]).to eq(merchants.last.updated_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all merchants with specified name" do
      Merchant.create(name: "Penney & Tired")
      Merchant.create(name: "Rails & Engine")
      Merchant.create(name: "Rails & Engine")

      get :index, name: "Rails & Engine", format: :json

      expect(json_response.count).to eq(2)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
