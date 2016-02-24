class Api::V1::InvoiceItems::ItemsController < ApplicationController
  respond_to :json

  def show
    respond_with InvoiceItem.find(params[:invoice_item_id]).item
  end
end
