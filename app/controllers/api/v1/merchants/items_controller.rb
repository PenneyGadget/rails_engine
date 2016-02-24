class Api::V1::Merchants::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.find(params[:merchant_id]).items
  end

end
