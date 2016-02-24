RSpec.describe Api::V1::Merchants::RevenuesController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    xit "returns the total revenue for a merchant across all transactions" do
      # merchant = create(:merchant)
      # invoice = create(:invoice)
      # merchant.invoices << invoice
      # transaction_1 = create(:transaction)
      # transaction_1.result = "success"
      # transaction_2 = create(:transaction)
      # transaction_2.result = "success"
      # items = create_list(:item, 3)
      # invoice.items << items
      # merchant.items << items
      # invoice.transactions << transactions

      get :show, merchant_id: merchant.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response).to eq()
    end
  end
end

# returns the total revenue for that merchant across all transactions
