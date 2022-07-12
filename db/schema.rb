# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_11_234022) do
  create_table "admins", force: :cascade do |t|
    t.string "nama"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "nama"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "informasi_edukasis", force: :cascade do |t|
    t.string "judul"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "conversation_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "quantity"
    t.float "subtotal"
    t.integer "order_id", null: false
    t.integer "waste_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "unit_price"
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["waste_id"], name: "index_order_details_on_waste_id"
  end

  create_table "orders", force: :cascade do |t|
    t.text "deskripsi"
    t.float "total", default: 0.0
    t.integer "penyalur_id", null: false
    t.integer "pengumpul_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pengumpul_id"], name: "index_orders_on_pengumpul_id"
    t.index ["penyalur_id"], name: "index_orders_on_penyalur_id"
  end

  create_table "pengumpuls", force: :cascade do |t|
    t.string "nama"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "penyalurs", force: :cascade do |t|
    t.string "nama"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wastes", force: :cascade do |t|
    t.string "nama"
    t.text "deskripsi"
    t.float "harga"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_wastes_on_category_id"
  end

  add_foreign_key "order_details", "orders"
  add_foreign_key "order_details", "wastes"
  add_foreign_key "orders", "pengumpuls"
  add_foreign_key "orders", "penyalurs"
  add_foreign_key "wastes", "categories"
end
