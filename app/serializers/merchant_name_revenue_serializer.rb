class MerchantNameRevenueSerializer
  include JSONAPI::Serializer
  attributes :name

  attribute :revenue do |object|
    object.total_revenue
  end

end
