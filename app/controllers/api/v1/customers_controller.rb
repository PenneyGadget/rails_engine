class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    #if statement to determine what param was passed in and find based on that
    respond_with Customer.find(params[:id]) if params[:id]
    respond_with Customer.where("customers.first_name ilike ?", params[:name].first)
    # respond_with Customer.where("NAME ilike ?", params[:name]).first)
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
