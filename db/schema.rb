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

ActiveRecord::Schema.define(version: 2020_04_06_235929) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "favour_applications", force: :cascade do |t|
    t.bigint "favour_id"
    t.bigint "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "message"
    t.string "status"
    t.index ["applicant_id"], name: "index_favour_applications_on_applicant_id"
    t.index ["favour_id"], name: "index_favour_applications_on_favour_id"
  end

  create_table "favours", force: :cascade do |t|
    t.string "category"
    t.string "title"
    t.text "description"
    t.string "address"
    t.string "status"
    t.bigint "recipient_id"
    t.bigint "helper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "completion_date"
    t.float "latitude"
    t.float "longitude"
    t.index ["helper_id"], name: "index_favours_on_helper_id"
    t.index ["recipient_id"], name: "index_favours_on_recipient_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "subject"
    t.integer "rating"
    t.text "description"
    t.bigint "recipient_id"
    t.bigint "helper_id"
    t.bigint "favour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favour_id"], name: "index_reviews_on_favour_id"
    t.index ["helper_id"], name: "index_reviews_on_helper_id"
    t.index ["recipient_id"], name: "index_reviews_on_recipient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "mobile"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favour_applications", "favours"
  add_foreign_key "favour_applications", "users", column: "applicant_id"
  add_foreign_key "favours", "users", column: "helper_id"
  add_foreign_key "favours", "users", column: "recipient_id"
  add_foreign_key "reviews", "favours"
  add_foreign_key "reviews", "users", column: "helper_id"
  add_foreign_key "reviews", "users", column: "recipient_id"
end
