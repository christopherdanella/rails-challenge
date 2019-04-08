class CreateVariations < ActiveRecord::Migration[5.2]
  def change
    create_table :variations do |t|
      t.integer :order_id
      t.integer :variant_id
      t.integer :variant_quantity

      t.timestamps
    end
  end
end
