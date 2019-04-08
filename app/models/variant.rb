class Variant < ApplicationRecord
  belongs_to :product
  has_many :variations
  has_many :orders, through: :variations
end
