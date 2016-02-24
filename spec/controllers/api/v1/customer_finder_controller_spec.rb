require 'rails_helper'

RSpec.describe Api::V1::CustomerFinderController, type: :controller do

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns customer with specified first_name" do
      customers = create_list(:customer, 3)

      get :show, first_name: customers.first.first_name, format: :json

      expect(json_response["first_name"]).to eq(customers.first.first_name)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns customer with specified last_name" do
      customers = create_list(:customer, 3)

      get :show, last_name: customers.last.last_name, format: :json

      expect(json_response["last_name"]).to eq(customers.last.last_name)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns customer with specified created at time" do
      customers = create_list(:customer, 3)

      get :show, created_at: customers.first.created_at, format: :json

      expect(json_response["created_at"]).to eq("2016-02-23T00:00:00.000Z")
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns customer with specified updated at time" do
      customers = create_list(:customer, 3)

      get :show, updated_at: customers.first.updated_at, format: :json

      expect(json_response["updated_at"]).to eq("2016-02-23T00:00:00.000Z")
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all customers with specified first_name" do
      Customer.create(first_name: "Penney", last_name: "Garrett")
      Customer.create(first_name: "Penney", last_name: "Gadget")
      Customer.create(first_name: "Sara", last_name: "Gadget")

      get :index, first_name: "penney", format: :json

      expect(json_response.count).to eq(2)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all customers with specified last_name" do
      Customer.create(first_name: "Penney", last_name: "Garrett")
      Customer.create(first_name: "Penney", last_name: "Gadget")
      Customer.create(first_name: "Sara", last_name: "Gadget")

      get :index, last_name: "GADGET", format: :json

      expect(json_response.count).to eq(2)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
