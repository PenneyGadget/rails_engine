class Api::V1::Items::MostItemsController < ApplicationController
  respond_to :json

  def index
    quantity
    sorted_items
    respond_with top_items
  end

  private

  def quantity
    params[:quantity].to_i
  end

  def sorted_items
    Invoice.all.joins(:transactions)
               .where(transactions: { result: "success" })
               .joins(:invoice_items)
               .order("sum(quantity) desc")
               .group(:item_id)
               .sum(:quantity)
               .to_a[0..quantity-1]
  end

  def top_items
    sorted_items.map { |item| item[0] }.map { |id| Item.find(id) }
  end
end
