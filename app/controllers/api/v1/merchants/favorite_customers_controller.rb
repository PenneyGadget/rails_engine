class Api::V1::Merchants::FavoriteCustomersController < ApplicationController
  respond_to :json

  def show
    result = Merchant.find(params[:merchant_id]).invoices
                                                .joins(:transactions)
                                                .where(transactions: { result: "success" })
                                                .group(:customer_id)
                                                .count.to_a
    cust_id = result.max_by { |cust| cust[1] }[0]
    respond_with Customer.find(cust_id)
  end
end
