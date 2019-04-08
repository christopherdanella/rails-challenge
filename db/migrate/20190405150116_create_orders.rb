class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, index: true 
      t.float :total_cost 
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
