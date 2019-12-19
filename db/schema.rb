# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_17_085213) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "rating"
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "order_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "orders_id", null: false
    t.bigint "products_id", null: false
    t.integer "quantity"
    t.decimal "price", precision: 10
    t.decimal "total_detail", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orders_id"], name: "index_order_details_on_orders_id"
    t.index ["products_id"], name: "index_order_details_on_products_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "date"
    t.string "first_name"
    t.string "last_name"
    t.string "tel"
    t.string "address"
    t.decimal "total", precision: 10
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "categories_id", null: false
    t.decimal "price", precision: 10
    t.integer "quantity"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categories_id"], name: "index_products_on_categories_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "tel"
    t.string "address"
    t.integer "active"
    t.string "activation_digest"
    t.datetime "active_at"
    t.string "password_digest"
    t.string "reset_digest"
    t.integer "role_id", default: 2
    t.datetime "reset_sent_at"
    t.string "remember_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "images", "products"
  add_foreign_key "order_details", "orders", column: "orders_id"
  add_foreign_key "order_details", "products", column: "products_id"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories", column: "categories_id"
end
