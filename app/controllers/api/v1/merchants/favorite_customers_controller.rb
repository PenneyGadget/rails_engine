class Api::V1::Merchants::FavoriteCustomersController < ApplicationController
  respond_to :json

  def show
    sorted_customers
    respond_with top_customer
  end

  private

  def sorted_customers
    Merchant.find(params[:merchant_id]).invoices
                                       .joins(:transactions)
                                       .where(transactions: { result: "success" })
                                       .group(:customer_id)
                                       .count.to_a
  end

  def top_customer
    customer_id = sorted_customers.max_by { |cust| cust[1] }[0]
    Customer.find(customer_id)
  end
end
