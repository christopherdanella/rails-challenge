class Order < ApplicationRecord
  before_save :set_total_cost 
  ORDER_STATUS = ['pending', 'processing', 'fulfilled', 'delivered', 'canceled'] 
  


  belongs_to :customer
  has_many :variations
  has_many :variants, through: :variations

  validates_presence_of :customer
   
  validates :status, inclusion: { in: ORDER_STATUS }
  
  def set_total_cost
    self.total_cost = variants.sum { |variant| variant.cost } 
  end
end
