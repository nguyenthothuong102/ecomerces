class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :orders, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.decimal :total_detail

      t.timestamps
    end
  end
end
