class Api::V1::SearchesController < ApplicationController
  def find
    merchant = Merchant.where("name ILIKE ?","%#{params[:name]}%").first
    if merchant.nil?
      render json: { data: { message: 'Merchant not found' } }
    else
      render json: MerchantSerializer.new(merchant)
    end
  end

  def find_all
    items = Item.where("name ILIKE ?", "%#{params[:name]}%")
    if items.nil?
      render json: { data: { message: 'Item not found' } }
    else
      render json: ItemSerializer.new(items)
    end
  end
end
