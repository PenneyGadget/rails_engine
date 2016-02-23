class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  private

  def invoice_params
    params.require(:invoice).permit(:id,
                                    :status,
                                    :customer_id,
                                    :merhchange_id,
                                    :created_at,
                                    :updated_at)
  end
end
