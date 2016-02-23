class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  private

  def invoice_item_params
    params.require(:invoice_items).permit(:id,
                                          :quantity,
                                          :unit_price,
                                          :item_id,
                                          :invoice_id,
                                          :created_at,
                                          :updated_at)
  end
end
