class Api::V1::CustomerFinderController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.where(params[:id]) if params[:id]
    respond_with Customer.where("first_name ILIKE ?", params[:first_name]) if params[:first_name]
    respond_with Customer.where("last_name ILIKE ?", params[:last_name]) if params[:last_name]
    respond_with Customer.where(created_at: params[:created_at]) if params[:created_at]
    respond_with Customer.where(updated_at: params[:updated_at]) if params[:updated_at]
  end

  def show
    respond_with Customer.find(params[:id]) if params[:id]
    respond_with Customer.find_by("first_name ILIKE ?", params[:first_name]) if params[:first_name]
    respond_with Customer.find_by("last_name ILIKE ?", params[:last_name]) if params[:last_name]
    respond_with Customer.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Customer.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end
end
