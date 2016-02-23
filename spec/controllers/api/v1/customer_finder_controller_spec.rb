require 'rails_helper'

RSpec.describe Api::V1::CustomerFinderController, type: :controller do

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns customer with specified name" do
      customers = create_list(:customer, 3)

      get :show, first_name: customers.first.first_name, format: :json
      expect(json_response["first_name"]).to eq(customers.first.first_name)
      expect(response).to be_success
      expect(response.status).to eq(200)

      get :show, first_name: customers.last.last_name, format: :json
      expect(json_response["last_name"]).to eq(customers.last.last_name)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    xit "returns customer with specified created or updated at time" do
      customers = create_list(:customer, 3)

      get :show, created_at: customers.first.created_at, format: :json
      expect(json_response["created_at"]).to eq(customers.first.created_at)
      expect(response).to be_success
      expect(response.status).to eq(200)

      get :show, updated_at: customers.last.updated_at, format: :json
      expect(json_response["updated_at"]).to eq(customers.last.updated_at)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
