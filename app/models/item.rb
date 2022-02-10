class Item < ApplicationRecord
  belongs_to :merchant
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price
  validates_presence_of :merchant_id
end
