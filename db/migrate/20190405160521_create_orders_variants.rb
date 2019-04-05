class CreateOrdersVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_variants do |t|
      t.belongs_to :order, index: true
      t.belongs_to :variant, index: true
    end
  end
end
