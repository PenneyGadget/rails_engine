class Api::V1::TransactionFinderController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.where(id: params[:id]) if params[:id]
    respond_with Transaction.where(credit_card_number: params[:credit_card_number]) if params[:credit_card_number]
    respond_with Transaction.where(result: params[:result]) if params[:result]
    respond_with Transaction.where(invoice_id: params[:invoice_id]) if params[:invoice_id]
    respond_with Transaction.where(created_at: params[:created_at]) if params[:created_at]
    respond_with Transaction.where(updated_at: params[:updated_at]) if params[:updated_at]
  end

  def show
    respond_with Transaction.find(params[:id]) if params[:id]
    respond_with Transaction.find_by(credit_card_number: params[:credit_card_number]) if params[:credit_card_number]
    respond_with Transaction.find_by(result: params[:result]) if params[:result]
    respond_with Transaction.find_by(invoice_id: params[:invoice_id]) if params[:invoice_id]
    respond_with Transaction.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Transaction.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end
end
