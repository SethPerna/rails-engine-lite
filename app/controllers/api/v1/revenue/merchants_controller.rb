class Api::V1::Revenue::MerchantsController < ApplicationController
  def index
    if params[:quantity].nil?
      render json: JSON.generate({error: "error"}), status: 400
    else
      number = params[:quantity]
      merchants = Merchant.top_merchants_by_revenue(number)
      render json: ::MerchantNameRevenueSerializer.new(merchants)
    end
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: ::MerchantRevenueSerializer.new(merchant)
  end

  
end
