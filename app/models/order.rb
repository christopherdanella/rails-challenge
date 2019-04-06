class Order < ApplicationRecord
  ORDER_STATUS = ['pending', 'processing', 'fulfilled', 'delivered', 'canceled'] 
  
  belongs_to :customer
  has_many :variations
  has_many :variants, through: :variations

  validates_presence_of :customer
   
  validates :status, inclusion: { in: ORDER_STATUS }
end
