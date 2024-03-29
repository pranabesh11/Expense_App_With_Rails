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

ActiveRecord::Schema[7.1].define(version: 2024_03_29_083413) do
  create_table "clusters", force: :cascade do |t|
    t.string "groupname"
    t.integer "userId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "groupIduuid"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.decimal "amount"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "date_and_time"
    t.string "category"
    t.string "payment_type"
    t.string "income_or_expense"
  end

  create_table "product_names", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tiny_clusters", force: :cascade do |t|
    t.integer "user_id"
    t.string "email"
    t.string "cluster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
