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

ActiveRecord::Schema[7.0].define(version: 2022_05_12_133103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.date "dob"
    t.string "phoneno"
    t.string "sex"
    t.date "joining_date"
    t.string "department"
    t.integer "salary"
    t.string "email"
    t.string "address"
    t.bigint "status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_id"], name: "index_employees_on_status_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "invoice_num"
    t.string "category"
    t.string "description"
    t.integer "amount"
    t.string "vendor"
    t.date "exp_date"
    t.bigint "status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comments"
    t.string "extras"
    t.index ["status_id"], name: "index_expenses_on_status_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "status_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employees", "statuses"
  add_foreign_key "expenses", "statuses"
end