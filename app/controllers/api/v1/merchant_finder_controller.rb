class Api::V1::MerchantFinderController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.where(params[:id]) if params[:id]
    respond_with Merchant.where("name ILIKE ?", params[:name]) if params[:name]
    respond_with Merchant.where(created_at: params[:created_at]) if params[:created_at]
    respond_with Merchant.where(updated_at: params[:updated_at]) if params[:updated_at]
  end

  def show
    respond_with Merchant.find(params[:id]) if params[:id]
    respond_with Merchant.find_by("name ILIKE ?", params[:name]) if params[:name]
    respond_with Merchant.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Merchant.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end
end
