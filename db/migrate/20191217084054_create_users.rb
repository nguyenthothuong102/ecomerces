class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :tel
      t.string :address
      t.integer :active
      t.string :activation_digest
      t.datetime :active_at
      t.string :password_digest
      t.string :reset_digest
      t.integer :role_id, default: 2
      t.datetime :reset_sent_at
      t.string :remember_digest

      t.timestamps
    end
  end
end
