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
    if params[:name]
      items = Item.where("name ILIKE ?", "%#{params[:name]}%")
    elsif params[:min_price]
      items = Item.where("unit_price > ?", params[:min_price])
    elsif params[:max_price]
      items = Item.where("unit_price < ?", params[:max_price])
    end

    if items.nil?
      render json: { data: { message: 'Item not found' } }
    else
      render json: ItemSerializer.new(items)
    end
  end
end
