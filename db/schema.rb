# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180412101642) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "handmade_categories", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.boolean "brand_flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ladies_categories", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.boolean "brand_flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mens_categories", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.boolean "brand_flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "method_of_payment"
    t.string "first_name"
    t.string "last_name"
    t.string "postal_code"
    t.integer "region_id"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.integer "product_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "user_id"
    t.string "brand"
    t.text "detail"
    t.integer "status"
    t.integer "burden_of_shipping_fee"
    t.integer "shipping_method"
    t.integer "region_id"
    t.integer "estimated_shipping_date"
    t.integer "price"
    t.boolean "sell_flg", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "thumbnail_id"
    t.integer "productable_id"
    t.string "productable_type"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nick_name"
    t.string "first_name"
    t.string "last_name"
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.string "postal_code"
    t.integer "region_id"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.string "telephone"
    t.boolean "admin_flg", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
