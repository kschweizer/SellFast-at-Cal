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

ActiveRecord::Schema.define(version: 2019_11_07_030441) do

  create_table "bids", force: :cascade do |t|
    t.integer "item_id"
    t.integer "bidder_id"
    t.float "amount"
    t.datetime "time_bidded"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bidder_id"], name: "index_bids_on_bidder_id"
    t.index ["item_id"], name: "index_bids_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "status", default: "BIDDING"
    t.string "description"
    t.float "current_price"
    t.float "purchase_price"
    t.datetime "time_listed"
    t.integer "seller_id"
    t.integer "highest_bidder"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seller_id"], name: "index_items_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "bids", "items"
  add_foreign_key "bids", "users", column: "bidder_id"
  add_foreign_key "items", "users", column: "seller_id"
end
