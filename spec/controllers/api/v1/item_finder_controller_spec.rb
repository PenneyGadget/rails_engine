require 'rails_helper'

RSpec.describe Api::V1::ItemFinderController, type: :controller do

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns item with specified name" do
      items = create_list(:item, 3)

      get :show, name: items.first.name, format: :json

      expect(json_response["name"]).to eq(items.first.name)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns item with specified description" do
      items = create_list(:item, 3)

      get :show, description: items.first.description, format: :json

      expect(json_response["description"]).to eq(items.first.description)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns item with specified unit price" do
      items = create_list(:item, 3)

      get :show, unit_price: items.last.unit_price, format: :json
      expect(json_response["unit_price"]).to eq(items.last.unit_price)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns item with specified merchant id" do
      items = create_list(:item, 3)

      get :show, merchant_id: items.last.merchant_id, format: :json
      expect(json_response["merchant_id"]).to eq(items.last.merchant_id)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    xit "returns item with specified created at time" do
      items = create_list(:item, 3)

      get :show, created_at: items.first.created_at, format: :json

      expect(json_response["created_at"]).to eq(items.first.created_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    xit "returns item with specified updated at time" do
      items = create_list(:item, 3)

      get :show, updated_at: items.last.updated_at, format: :json

      expect(json_response["updated_at"]).to eq(items.last.updated_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all items with specified name" do
      Item.create(name: "Apple")
      Item.create(name: "Cherry")
      Item.create(name: "Apple")

      get :index, name: "Apple", format: :json

      expect(json_response.count).to eq(2)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all items with specified description" do
      Item.create(description: "Juicy")
      Item.create(description: "Tart")
      Item.create(description: "Tart")

      get :index, description: "Juicy", format: :json

      expect(json_response.count).to eq(1)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all items with specified unit_price" do
      Item.create(unit_price: 88888)
      Item.create(unit_price: 46374)
      Item.create(unit_price: 46374)

      get :index, unit_price: "463.74", format: :json

      expect(json_response.count).to eq(2)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
