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

ActiveRecord::Schema.define(version: 2020_03_26_210706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favour_applications", "favours"
  add_foreign_key "favour_applications", "users", column: "applicant_id"
  add_foreign_key "favours", "users", column: "helper_id"
  add_foreign_key "favours", "users", column: "recipient_id"
  add_foreign_key "reviews", "favours"
  add_foreign_key "reviews", "users", column: "helper_id"
  add_foreign_key "reviews", "users", column: "recipient_id"
end
