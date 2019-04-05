class Variant < ApplicationRecord
  belongs_to :product
  has_many :orders
end
