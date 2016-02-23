class Api::V1::InvoiceFinderController < ApplicationController
  respond_to :json

  def index
    #multi finder
  end

  def show
    respond_with Invoice.find(params[:id]) if params[:id]
    respond_with Invoice.find_by(status: params[:status]) if params[:status]
    respond_with Invoice.find_by(customer_id: params[:customer_id]) if params[:customer_id]
    respond_with Invoice.find_by(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Invoice.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Invoice.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end
end
