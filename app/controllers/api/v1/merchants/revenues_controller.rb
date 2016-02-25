class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    if params[:date]
      respond_with({revenue: merchant_revenue_by_date})
    else
      respond_with({revenue: merchant_revenue})
    end
  end

  private

  def merchant_revenue_by_date
    Merchant.find(params[:merchant_id]).invoices
                                       .where(created_at: params[:date])
                                       .joins(:transactions)
                                       .where("transactions.result = ?", "success")
                                       .joins(:invoice_items)
                                       .sum("unit_price * quantity")
  end

  def merchant_revenue
    Merchant.find(params[:merchant_id]).invoices
                                       .joins(:transactions)
                                       .where("transactions.result = ?", "success")
                                       .joins(:invoice_items)
                                       .sum("unit_price * quantity")
  end
end
