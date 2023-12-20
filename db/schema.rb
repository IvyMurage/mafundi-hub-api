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

ActiveRecord::Schema[7.1].define(version: 2023_12_20_115413) do
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

  create_table "appointments", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "task_id", null: false
    t.bigint "handyman_id", null: false
    t.datetime "appointment_date"
    t.integer "duration"
    t.text "appointment_notes"
    t.string "appointment_status"
    t.time "appointment_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_method"
    t.bigint "job_proposal_id"
    t.index ["client_id"], name: "index_appointments_on_client_id"
    t.index ["handyman_id"], name: "index_appointments_on_handyman_id"
    t.index ["job_proposal_id"], name: "index_appointments_on_job_proposal_id"
    t.index ["task_id"], name: "index_appointments_on_task_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "handymen", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.text "description"
    t.string "phone_number"
    t.integer "year_of_experience", default: 0
    t.integer "service_id"
    t.boolean "availability", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "handyman_skills"
    t.text "media_url"
    t.index ["user_id"], name: "index_handymen_on_user_id"
  end

  create_table "job_proposals", force: :cascade do |t|
    t.bigint "task_id"
    t.string "job_status", default: "inprogress"
    t.text "proposal_text"
    t.bigint "handyman_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["handyman_id"], name: "index_job_proposals_on_handyman_id"
    t.index ["task_id"], name: "index_job_proposals_on_task_id"
  end

  create_table "locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "city"
    t.string "county"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locationable_type"
    t.bigint "locationable_id"
    t.index ["locationable_type", "locationable_id"], name: "index_locations_on_locationable"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.integer "handyman_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id", null: false
    t.index ["client_id"], name: "index_reviews_on_client_id"
  end

  create_table "service_categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "service_name"
    t.bigint "service_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_category_id"], name: "index_services_on_service_category_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "job_title"
    t.bigint "client_id", null: false
    t.text "task_description"
    t.decimal "job_price", precision: 10, scale: 2, default: "0.0"
    t.integer "service_id"
    t.boolean "available", default: true
    t.boolean "instant_booking", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "duration_label"
    t.text "task_responsibilities"
    t.index ["client_id"], name: "index_tasks_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "avatar_url"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "clients"
  add_foreign_key "appointments", "handymen"
  add_foreign_key "appointments", "job_proposals"
  add_foreign_key "appointments", "tasks"
  add_foreign_key "handymen", "users"
  add_foreign_key "reviews", "clients"
  add_foreign_key "services", "service_categories"
  add_foreign_key "tasks", "clients"
end
