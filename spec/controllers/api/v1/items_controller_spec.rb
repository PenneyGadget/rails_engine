require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all items in json format" do
      items = create_list(:item, 3)

      get :index, format: :json

      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.first["name"]).to eq(items.first.name)
      expect(json_response.last["description"]).to eq(items.last.description)
      expect(json_response.last["unit_price"]).to eq(items.last.unit_price)
      expect(json_response.last["merchant_id"]).to eq(items.last.merchant_id)
      expect(json_response.count).to eq(3)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns item with specified id in json" do
      item = create(:item)

      get :show, id: item.id, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["name"]).to eq(item.name)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
      # expect(json_response["created_at"]).to eq(item.created_at)
      # expect(json_response["updated_at"]).to eq(item.updated_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
