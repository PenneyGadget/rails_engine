require 'rails_helper'

RSpec.describe Api::V1::Merchants::FavoriteCustomersController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns a merchants most successful customer" do
      merchant = create(:merchant)
      customer_1, customer_2 = create_list(:customer, 2)
      invoice_1 = create(:invoice, merchant_id: merchant.id, customer_id: customer_2.id)
      invoice_2 = create(:invoice, merchant_id: merchant.id, customer_id: customer_1.id)
      invoice_3 = create(:invoice, merchant_id: merchant.id, customer_id: customer_2.id)
      create(:transaction, invoice_id: invoice_1.id, result: "success")
      create(:transaction, invoice_id: invoice_2.id, result: "success")
      create(:transaction, invoice_id: invoice_3.id, result: "success")

      get :show, merchant_id: merchant.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(json_response["id"]).to eq(customer_2.id)
      expect(json_response["first_name"]).to eq(customer_2.first_name)
      expect(json_response["last_name"]).to eq(customer_2.last_name)
    end
  end
end
