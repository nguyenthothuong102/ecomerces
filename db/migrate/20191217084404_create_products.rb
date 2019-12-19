class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :categories, null: false, foreign_key: true
      t.decimal :price
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
