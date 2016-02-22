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

ActiveRecord::Schema.define(version: 20160222014332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "activities", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "title"
    t.text     "details"
    t.datetime "deadline"
    t.string   "status"
    t.integer  "amount"
    t.string   "handle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "likes"
    t.string   "avatar"
  end

  create_table "activity_products", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "activity_users", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "user_id"
    t.integer  "likes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "liked_users",              array: true
  end

  add_index "activity_users", ["liked_users"], name: "index_activity_users_on_liked_users", using: :gin

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
    t.string   "avatar"
  end

  create_table "diymenus", force: :cascade do |t|
    t.integer  "shop_public_account_id"
    t.integer  "parent_id"
    t.string   "name"
    t.string   "key"
    t.string   "url"
    t.boolean  "is_show"
    t.integer  "sort"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "diymenus", ["key"], name: "index_diymenus_on_key", using: :btree
  add_index "diymenus", ["parent_id"], name: "index_diymenus_on_parent_id", using: :btree
  add_index "diymenus", ["shop_public_account_id"], name: "index_diymenus_on_shop_public_account_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "favoriteable_id"
    t.string   "favoriteable_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
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

  create_table "merchant_advertisements", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "title"
    t.string   "content"
    t.decimal  "divide_into"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "private_token"
    t.string   "password_digest"
    t.datetime "private_token_updated_at"
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
    t.integer  "worker_id"
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

  create_table "shop_advertisement_users", force: :cascade do |t|
    t.integer  "shop_advertisement_id"
    t.integer  "user_id"
    t.integer  "forwarding_times"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "shop_advertisements", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "title"
    t.string   "content"
    t.decimal  "divide_into"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "avatar"
  end

  create_table "shop_public_accounts", force: :cascade do |t|
    t.integer  "shop_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "weixin_secret_key"
    t.string   "weixin_token"
    t.string   "app_id"
    t.string   "app_secret"
    t.string   "public_account"
  end

  add_index "shop_public_accounts", ["weixin_secret_key"], name: "index_shop_public_accounts_on_weixin_secret_key", using: :btree
  add_index "shop_public_accounts", ["weixin_token"], name: "index_shop_public_accounts_on_weixin_token", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string    "name"
    t.string    "street"
    t.string    "mobile"
    t.string    "avatar"
    t.string    "province"
    t.string    "city"
    t.string    "district"
    t.integer   "merchant_id"
    t.datetime  "created_at",                                                           null: false
    t.datetime  "updated_at",                                                           null: false
    t.float     "lat"
    t.float     "lng"
    t.geography "location",    limit: {:srid=>4326, :type=>"point", :geographic=>true}
  end

  create_table "users", force: :cascade do |t|
    t.string   "mobile"
    t.string   "password_digest"
    t.string   "private_token"
    t.string   "weixin_access_token"
    t.string   "weixin_refresh_token"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "weixin_open_id"
    t.string   "name"
    t.string   "nickname"
    t.string   "avatar"
    t.string   "provider"
    t.string   "uid"
    t.datetime "private_token_updated_at"
  end

  create_table "wechat_sessions", force: :cascade do |t|
    t.string   "openid",     null: false
    t.string   "hash_store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wechat_sessions", ["openid"], name: "index_wechat_sessions_on_openid", unique: true, using: :btree

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
