class Order < ApplicationRecord
  ORDER_STATUS = ['pending', 'processing', 'fulfilled', 'delivered', 'canceled'] 
  
  belongs_to :customer

  validates_presence_of :customer
  validates :status, inclusion: { in: ORDER_STATUS }
end
