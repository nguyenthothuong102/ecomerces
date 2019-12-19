class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :date
      t.string :first_name
      t.string :last_name
      t.string :tel
      t.string :address
      t.decimal :total
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
