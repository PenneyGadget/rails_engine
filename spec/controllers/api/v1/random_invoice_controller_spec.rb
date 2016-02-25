require 'rails_helper'

RSpec.describe Api::V1::RandomInvoiceController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns a random invoice" do
      create_list(:invoice, 3)

      get :show, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
