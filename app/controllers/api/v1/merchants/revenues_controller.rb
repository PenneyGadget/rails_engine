class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    result =  Merchant.find(params[:merchant_id]).invoices
                                                 .joins(:transactions)
                                                 .where("transactions.result = ?", "success")
                                                 .joins(:invoice_items)
                                                 .sum("unit_price * quantity")
    respond_with({revenue: result})
  end
end
