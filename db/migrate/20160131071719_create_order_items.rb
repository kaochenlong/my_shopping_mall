class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
