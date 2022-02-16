class ItemsSoldSerializer
  include JSONAPI::Serializer
  attributes :name

  attribute :count do |object|
    object.total_item_sold
  end

end
