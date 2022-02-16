class ItemSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :unit_price, :merchant_id

  def self.error_message
    render json: { data: { message: "Item not found"} }
  end
end
