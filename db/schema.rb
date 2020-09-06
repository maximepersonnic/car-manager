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

ActiveRecord::Schema.define(version: 2020_09_06_081456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.bigint "brand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_car_models_on_brand_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "registration"
    t.date "date_of_registration"
    t.bigint "car_model_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["car_model_id"], name: "index_cars_on_car_model_id"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "maintenances", force: :cascade do |t|
    t.text "description"
    t.date "date"
    t.bigint "car_id", null: false
    t.bigint "mileage_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_maintenances_on_car_id"
    t.index ["mileage_id"], name: "index_maintenances_on_mileage_id"
  end

  create_table "maintenances_operations", force: :cascade do |t|
    t.bigint "operation_id", null: false
    t.bigint "maintenance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maintenance_id"], name: "index_maintenances_operations_on_maintenance_id"
    t.index ["operation_id"], name: "index_maintenances_operations_on_operation_id"
  end

  create_table "mileages", force: :cascade do |t|
    t.integer "value"
    t.bigint "car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "statement_date"
    t.index ["car_id"], name: "index_mileages_on_car_id"
  end

  create_table "operations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_operations_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.float "amount"
    t.text "description"
    t.bigint "car_id", null: false
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_transactions_on_car_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "car_models", "brands"
  add_foreign_key "cars", "car_models"
  add_foreign_key "cars", "users"
  add_foreign_key "maintenances", "cars"
  add_foreign_key "maintenances", "mileages"
  add_foreign_key "maintenances_operations", "maintenances"
  add_foreign_key "maintenances_operations", "operations"
  add_foreign_key "mileages", "cars"
  add_foreign_key "operations", "users"
  add_foreign_key "transactions", "cars"
end
