class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :rating
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.datetime :data

      t.timestamps
    end
  end
end
