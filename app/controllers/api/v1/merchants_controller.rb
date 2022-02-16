class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    if Merchant.exists?(params[:id])
      render json: MerchantSerializer.new(Merchant.find(params[:id]))
    else
      render status: 404
    end
  end

  def most_items
    if params[:quantity].nil?
      render json: JSON.generate({error: "error"}), status: 400
    else
      number = params[:quantity]
      merchant = Merchant.item_revenue(number)
      render json: ItemsSoldSerializer.new(merchant)
    end
  end
end
