class Api::V1::ItemFinderController < ApplicationController
  respond_to :json

  def index
    respond_with Item.where(params[:id]) if params[:id]
    respond_with Item.where("name ILIKE ?", params[:name]) if params[:name]
    respond_with Item.where("description ILIKE ?", params[:description]) if params[:description]
    respond_with Item.where(unit_price: params[:unit_price]) if params[:unit_price]
    respond_with Item.where(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Item.where(created_at: params[:created_at]) if params[:created_at]
    respond_with Item.where(updated_at: params[:updated_at]) if params[:updated_at]
  end

  def show
    respond_with Item.find(params[:id]) if params[:id]
    respond_with Item.find_by("name ILIKE ?", params[:name]) if params[:name]
    respond_with Item.find_by("description ILIKE ?", params[:description]) if params[:description]
    respond_with Item.find_by(unit_price: params[:unit_price]) if params[:unit_price]
    respond_with Item.find_by(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Item.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Item.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end
end
