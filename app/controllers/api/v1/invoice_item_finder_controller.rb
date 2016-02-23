class Api::V1::InvoiceItemFinderController < ApplicationController
  respond_to :json

  def index
    #multi finder
  end

  def show
    respond_with InvoiceItem.find(params[:id]) if params[:id]
    respond_with InvoiceItem.find_by(quantity: params[:quantity]) if params[:quantity]
    respond_with InvoiceItem.find_by(unit_price: params[:unit_price]) if params[:unit_price]
    respond_with InvoiceItem.find_by(item_id: params[:item_id]) if params[:item_id]
    respond_with InvoiceItem.find_by(invoice_id: params[:invoice_id]) if params[:invoice_id]
    respond_with InvoiceItem.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with InvoiceItem.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end
end
