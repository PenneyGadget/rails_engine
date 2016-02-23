require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all merchants in json format" do
      merchants = create_list(:merchant, 3)

      get :index, format: :json

      expect(json_response.first["id"]).to eq(merchants.first.id)
      expect(json_response.last["name"]).to eq(merchants.last.name)
      expect(json_response.count).to eq(3)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns merchant with specified id in json" do
      merchant = create(:merchant)

      get :show, id: merchant.id, format: :json

      expect(json_response["id"]).to eq(merchant.id)
      expect(json_response["name"]).to eq(merchant.name)
      # expect(json_response["created_at"]).to eq(merchant.created_at)
      # expect(json_response["updated_at"]).to eq(merchant.updated_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
