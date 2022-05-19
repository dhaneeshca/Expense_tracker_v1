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

ActiveRecord::Schema[7.0].define(version: 2022_05_19_053027) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "comments", force: :cascade do |t|
    t.string "message"
    t.string "user"
    t.integer "user_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "expense_id", null: false
    t.index ["expense_id"], name: "index_comments_on_expense_id"
  end

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
    t.string "extras"
    t.bigint "admin_id", null: false
    t.bigint "employee_id", null: false
    t.bigint "report_id", null: false
    t.index ["admin_id"], name: "index_expenses_on_admin_id"
    t.index ["employee_id"], name: "index_expenses_on_employee_id"
    t.index ["report_id"], name: "index_expenses_on_report_id"
    t.index ["status_id"], name: "index_expenses_on_status_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "title"
    t.integer "applied_amt", default: 0
    t.integer "reimb_amt", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mail_flag", default: 0
  end

  create_table "statuses", force: :cascade do |t|
    t.string "status_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "expenses"
  add_foreign_key "employees", "statuses"
  add_foreign_key "expenses", "admins"
  add_foreign_key "expenses", "employees"
  add_foreign_key "expenses", "reports"
  add_foreign_key "expenses", "statuses"
end
