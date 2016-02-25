class Api::V1::Customers::FavoriteMerchantsController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.find(favorite_merchant)
  end

  private

  def favorite_merchant
    sorted_merchants.max_by { |merchant| merchant[1] }[0]
  end

  def sorted_merchants
    Customer.find(params[:customer_id]).invoices
                                       .joins(:transactions)
                                       .where(transactions: { result: "success" })
                                       .group(:merchant_id)
                                       .count.to_a
  end
end
