require 'rails_helper'

RSpec.describe Api::V1::Customers::FavoriteMerchantsController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns a customers most frequented merchant" do
      customer = create(:customer)
      merchant_1, merchant_2 = create_list(:merchant, 2)
      invoice_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant_2.id)
      invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant_1.id)
      invoice_3 = create(:invoice, customer_id: customer.id, merchant_id: merchant_2.id)
      create(:transaction, invoice_id: invoice_1.id, result: "success")
      create(:transaction, invoice_id: invoice_2.id, result: "success")
      create(:transaction, invoice_id: invoice_3.id, result: "success")

      get :show, customer_id: customer.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(json_response["id"]).to eq(merchant_2.id)
      expect(json_response["name"]).to eq(merchant_2.name)
    end
  end
end
