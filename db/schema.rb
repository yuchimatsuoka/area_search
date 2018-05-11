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

ActiveRecord::Schema.define(version: 20180511061439) do

  create_table "areas", primary_key: "area_id", force: :cascade do |t|
    t.text    "middle_area_code", limit: 65535
    t.text    "middle_area_name", limit: 65535
    t.integer "count",            limit: 8
    t.float   "price_mean",       limit: 53
  end

  create_table "posts", force: :cascade do |t|
    t.text     "text",          limit: 65535
    t.integer  "small_area_id", limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "shops", force: :cascade do |t|
    t.text    "name",             limit: 65535
    t.text    "open",             limit: 65535
    t.text    "midnight",         limit: 65535
    t.text    "middle_area_name", limit: 65535
    t.text    "middle_area_code", limit: 65535
    t.text    "small_area_name",  limit: 65535
    t.text    "small_area_code",  limit: 65535
    t.text    "genre",            limit: 65535
    t.text    "food_name",        limit: 65535
    t.text    "price",            limit: 65535
    t.float   "rep_price",        limit: 53
    t.text    "open_hour",        limit: 65535
    t.integer "start",            limit: 8
    t.integer "end",              limit: 8
    t.float   "o16",              limit: 53
    t.float   "o17",              limit: 53
    t.float   "o18",              limit: 53
    t.float   "o19",              limit: 53
    t.float   "o20",              limit: 53
    t.float   "o21",              limit: 53
    t.float   "o22",              limit: 53
    t.float   "o23",              limit: 53
    t.float   "o24",              limit: 53
    t.float   "o25",              limit: 53
    t.float   "o26",              limit: 53
    t.float   "o27",              limit: 53
    t.float   "o28",              limit: 53
    t.float   "o29",              limit: 53
    t.integer "area_id",          limit: 8
    t.integer "small_area_id",    limit: 8
  end

  create_table "small_areas", primary_key: "small_id", force: :cascade do |t|
    t.text    "small_area_code", limit: 65535
    t.text    "small_area_name", limit: 65535
    t.integer "area_id",         limit: 8
    t.integer "count",           limit: 8
    t.float   "price_mean",      limit: 53
    t.float   "o16",             limit: 53
    t.float   "o17",             limit: 53
    t.float   "o18",             limit: 53
    t.float   "o19",             limit: 53
    t.float   "o20",             limit: 53
    t.float   "o21",             limit: 53
    t.float   "o22",             limit: 53
    t.float   "o23",             limit: 53
    t.float   "o24",             limit: 53
    t.float   "o25",             limit: 53
    t.float   "o26",             limit: 53
    t.float   "o27",             limit: 53
    t.float   "o28",             limit: 53
    t.float   "o29",             limit: 53
    t.float   "or23",            limit: 53
    t.float   "or24",            limit: 53
    t.float   "or25",            limit: 53
    t.float   "or26",            limit: 53
    t.float   "or27",            limit: 53
    t.float   "or28",            limit: 53
    t.float   "or29",            limit: 53
    t.integer "イタリア料理",          limit: 8
    t.integer "インド料理",           limit: 8
    t.integer "おでん",             limit: 8
    t.integer "かに・えび・うに・海鮮料理",   limit: 8
    t.integer "しゃぶしゃぶ",          limit: 8
    t.integer "ステーキ",            limit: 8
    t.integer "スペイン料理",          limit: 8
    t.integer "タイ料理",            limit: 8
    t.integer "フランス料理",          limit: 8
    t.integer "沖縄料理",            limit: 8
    t.integer "郷土料理",            limit: 8
    t.integer "焼き鳥・鶏料理",         limit: 8
    t.integer "中華料理",            limit: 8
    t.integer "炉ばた焼き・炙り焼き",      limit: 8
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "nickname",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
