class Api::V1::Items::MostRevenuesController < ApplicationController
  respond_to :json

  def index
    quantity = params[:quantity].to_i
    result = Invoice.all.joins(:transactions)
                        .where(transactions: { result: "success" })
                        .joins(:invoice_items)
                        .order("sum(quantity) desc")
                        .group(:item_id)
                        .sum(:unit_price)
                        .to_a[0..quantity-1]
    items_ids = result.map { |r| r[0] }
    top_items = items_ids.map { |id| Item.find(id) }
    respond_with top_items
  end
end
