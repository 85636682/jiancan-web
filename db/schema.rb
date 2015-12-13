# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151213072847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "add_private_token_update_at_to_workers", force: :cascade do |t|
    t.datetime "private_token_updated_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "private_token"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_materials", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar"
    t.integer  "stock_balance"
    t.integer  "minimum_stock"
    t.integer  "maximum_stock"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "shop_id"
  end

  create_table "jc_logs", force: :cascade do |t|
    t.text     "content"
    t.string   "level"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "market_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "market_order_market_products", force: :cascade do |t|
    t.integer  "market_order_id"
    t.integer  "market_product_id"
    t.integer  "count"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "merchant_id"
  end

  create_table "market_orders", force: :cascade do |t|
    t.string   "sn"
    t.integer  "merchant_id"
    t.integer  "shop_id"
    t.decimal  "total_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "market_products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "avatar"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "market_category_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "private_token"
  end

  add_index "merchants", ["email"], name: "index_merchants_on_email", unique: true, using: :btree
  add_index "merchants", ["reset_password_token"], name: "index_merchants_on_reset_password_token", unique: true, using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.string   "content_path"
    t.integer  "merchant_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "read"
    t.integer  "order_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "sn"
    t.boolean  "takeout"
    t.decimal  "total_price"
    t.string   "status"
    t.integer  "shop_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "room_id"
    t.integer  "worker_id"
    t.decimal  "collect"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "avatar"
    t.integer  "shop_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "category_id"
    t.integer  "sales_volume"
  end

  create_table "receiving_addresses", force: :cascade do |t|
    t.string   "consignee"
    t.string   "mobile"
    t.string   "province"
    t.string   "city"
    t.string   "district"
    t.string   "street"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "seat"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "mobile"
    t.string   "avatar"
    t.string   "province"
    t.string   "city"
    t.string   "district"
    t.integer  "merchant_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "mobile"
    t.string   "password_digest"
    t.string   "private_token"
    t.string   "weixin_access_token"
    t.string   "weixin_refresh_token"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "weixin_open_id"
    t.string   "name"
    t.string   "nickname"
    t.string   "avatar"
  end

  create_table "workers", force: :cascade do |t|
    t.string   "imei"
    t.integer  "shop_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "name"
    t.string   "private_token"
    t.string   "login"
    t.string   "password_digest"
    t.string   "department"
    t.datetime "private_token_updated_at"
  end

end
