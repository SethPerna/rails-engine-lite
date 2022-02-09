class Api::V1::SearchesController < ApplicationController
  def find
    @merchant = Merchant.where("name ILIKE ?","%#{params[:name]}%").first
    if @merchant != nil
      render json: MerchantSerializer.new(@merchant)
    else @merchant = []
      render status: 404
    end
  end
end
