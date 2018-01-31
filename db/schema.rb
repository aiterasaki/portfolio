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

ActiveRecord::Schema.define(version: 20180126045848) do

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
    t.boolean "sell_flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "thumbnail_id"
    # ポリモーフィック関連用の、ladies_categoryのidや名前を入れるカラム追加
    t.integer "productable_id"
    t.string "productable_type"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
