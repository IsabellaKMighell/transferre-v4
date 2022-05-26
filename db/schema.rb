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

ActiveRecord::Schema.define(version: 2022_05_26_190143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "transferrable_transactions", force: :cascade do |t|
    t.integer "transactor_id"
    t.integer "transactee_id"
    t.float "cost"
    t.string "category"
    t.string "message"
    t.boolean "confirmed"
    t.boolean "transaction_to_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_expenses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "cost"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_expenses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.float "balance"
    t.float "remainder"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "user_expenses", "users"
end
