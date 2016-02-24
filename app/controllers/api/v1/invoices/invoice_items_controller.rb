class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.find(params[:invoice_id]).invoice_items
  end
end
