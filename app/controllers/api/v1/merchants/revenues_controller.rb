class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    if params[:date]
      result =  Merchant.find(params[:merchant_id]).invoices
                                                   .where(created_at: params[:date])
                                                   .joins(:transactions)
                                                   .where("transactions.result = ?", "success")
                                                   .joins(:invoice_items)
                                                   .sum("unit_price * quantity")
      respond_with({revenue: result})
    else
      result =  Merchant.find(params[:merchant_id]).invoices
                                                   .joins(:transactions)
                                                   .where("transactions.result = ?", "success")
                                                   .joins(:invoice_items)
                                                   .sum("unit_price * quantity")
      respond_with({revenue: result})
    end
  end
end
