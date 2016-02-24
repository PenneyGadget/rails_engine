class Api::V1::RandomInvoiceController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.order("RANDOM()").first
  end

end
