class Api::V1::RandomItemController < ApplicationController
  respond_to :json

  def show
    respond_with Item.unscoped.order("RANDOM()").first
  end

end
