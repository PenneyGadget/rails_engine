class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find(params[:id])
  end

  private

  def transaction_params
    params.require(:item).permit(:id,
                                 :credit_card_number,
                                 :result,
                                 :invoice_id,
                                 :created_at,
                                 :updated_at)
  end
end
