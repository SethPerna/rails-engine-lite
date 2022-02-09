class Api::V1::SearchesController < ApplicationController
  def find
    @merchant = Merchant.where("name ILIKE ?","%#{params[:name]}%").first
    if @merchant.nil?
      render json: { data: { message: 'Merchant not found' } }
    else
      render json: MerchantSerializer.new(@merchant)
    end
  end
end
