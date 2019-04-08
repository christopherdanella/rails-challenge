class Order < ApplicationRecord
  before_save :set_total_cost
  before_save :handle_out_of_stock

  ORDER_STATUS = ['pending', 'processing', 'fulfilled', 'delivered', 'canceled'] 

  belongs_to :customer
  has_many :variations
  has_many :variants, through: :variations

  validates_presence_of :customer

  validates :status, inclusion: { in: ORDER_STATUS }

  def as_json(options={})
    super(include: :variants)
  end 
  
  def set_total_cost
    self.total_cost = variants.sum { |variant| variant.cost } 
  end

  # Custom validation to check for stock_amount on variations before order is saved.
  # I'm having trouble forcing variants to exist during order creation.
  # Adding a validation for the presence of :variants isn't solving this either.

  def handle_out_of_stock
    variants.each do |variant|
      if variant.stock_amount < 1
        errors.add(:base, "Product is out of stock.")
      end
    end
  end
end
