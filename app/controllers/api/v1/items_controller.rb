class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    if Item.exists?(params[:id])
      render json: ItemSerializer.new(Item.find(params[:id]))
    else
      render status: 404
    end 
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: ItemSerializer.new(Item.create(item_params)), status: :created
    else
      render status: 404
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params) #&& Merchant.find(params[:item][:merchant_id])
      render json: ItemSerializer.new(item)
    else
      render status: 404
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      render status: :no_content
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end
