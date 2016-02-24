class Api::V1::Merchants::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.find(params[:merchant_id]).invoices
  end

end
