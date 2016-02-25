class Api::V1::Customers::FavoriteMerchantsController < ApplicationController
  respond_to :json

  def show
    result = Customer.find(params[:customer_id]).invoices
                                                .joins(:transactions)
                                                .where(transactions: { result: "success" })
                                                .group(:merchant_id)
                                                .count.to_a
    merchant_id = result.max_by { |merchant| merchant[1] }[0]
    respond_with Merchant.find(merchant_id)
  end
end
