class Api::V1::Invoices::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.find(params[:invoice_id]).items
  end

end
