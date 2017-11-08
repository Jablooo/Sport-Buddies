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

ActiveRecord::Schema.define(version: 20171105103516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buddies", id: false, force: :cascade do |t|
    t.bigint "followed_id", null: false
    t.bigint "follower_id", null: false
    t.index ["followed_id", "follower_id"], name: "index_buddies_on_followed_id_and_follower_id", unique: true
    t.index ["follower_id", "followed_id"], name: "index_buddies_on_follower_id_and_followed_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "photo_data"
    t.string "name"
    t.string "description"
    t.decimal "selling_price", precision: 8, scale: 3
    t.decimal "renting_price", precision: 8, scale: 3
    t.integer "quantity"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "avatar_data"
    t.string "first_name"
    t.string "last_name"
    t.string "sex"
    t.date "DOB"
    t.string "street"
    t.string "postcode"
    t.string "state"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.string "sport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buddies", "users", column: "followed_id"
  add_foreign_key "buddies", "users", column: "follower_id"
  add_foreign_key "items", "users"
  add_foreign_key "profiles", "users"
end
