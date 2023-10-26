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

ActiveRecord::Schema.define(version: 320221118064723) do

  create_table "accounts", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.integer "students_count", default: 0, null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_accounts_on_name", unique: true
  end

  create_table "active_storage_attachments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: 6, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "assignment_types", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "account_id"
    t.integer "user_id"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assignments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "account_id"
    t.integer "assignment_type_id"
    t.integer "file_id"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", charset: "utf8mb3", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.string "student_id"
    t.string "tutor_id"
    t.string "link"
    t.string "channel"
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "meeting_id"
    t.string "user_id"
    t.string "region"
    t.string "video_id"
    t.string "language_id"
    t.string "slot_id"
  end

  create_table "camera_logs", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.bigint "flight_id"
    t.bigint "user_id"
    t.json "camera_specifications"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_camera_logs_on_flight_id"
    t.index ["user_id"], name: "index_camera_logs_on_user_id"
  end

  create_table "cars", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "control_centers", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_control_centers_on_location_id"
    t.index ["user_id"], name: "index_control_centers_on_user_id"
  end

  create_table "database_connections", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "provide"
    t.string "username"
    t.string "password"
    t.string "access_token"
    t.json "metadata"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destination_flight_plans", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "destination_id"
    t.bigint "flight_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_destination_flight_plans_on_destination_id"
    t.index ["flight_plan_id"], name: "index_destination_flight_plans_on_flight_plan_id"
  end

  create_table "destinations", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.bigint "flight_plan_id"
    t.bigint "user_id"
    t.bigint "location_id"
    t.string "control_type"
    t.json "metadata"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_plan_id"], name: "index_destinations_on_flight_plan_id"
    t.index ["location_id"], name: "index_destinations_on_location_id"
    t.index ["user_id"], name: "index_destinations_on_user_id"
  end

  create_table "drone_flights", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "drone_id"
    t.bigint "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drone_id"], name: "index_drone_flights_on_drone_id"
    t.index ["flight_id"], name: "index_drone_flights_on_flight_id"
  end

  create_table "drones", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.string "mac_address"
    t.string "ipv4"
    t.string "flight_type"
    t.integer "flights_count"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", charset: "utf8mb3", force: :cascade do |t|
    t.integer "account"
    t.string "event"
    t.string "event_type"
    t.json "meta"
    t.json "address"
    t.json "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flight_plans", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "control_type", default: "Auto"
    t.string "status", default: "Ready"
    t.bigint "user_id"
    t.integer "flight_plan_type"
    t.bigint "start_location_id"
    t.bigint "destination_id"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "control_center_id"
    t.index ["destination_id"], name: "index_flight_plans_on_destination_id"
    t.index ["start_location_id"], name: "index_flight_plans_on_start_location_id"
    t.index ["user_id"], name: "index_flight_plans_on_user_id"
  end

  create_table "flights", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "flight_code"
    t.string "flight_type"
    t.string "status"
    t.bigint "user_id"
    t.bigint "drone_id"
    t.bigint "flight_plan_id"
    t.bigint "fly_zone_id"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drone_id"], name: "index_flights_on_drone_id"
    t.index ["flight_plan_id"], name: "index_flights_on_flight_plan_id"
    t.index ["fly_zone_id"], name: "index_flights_on_fly_zone_id"
    t.index ["user_id"], name: "index_flights_on_user_id"
  end

  create_table "fly_zone_flight_plans", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "fly_zone_id"
    t.bigint "flight_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_plan_id"], name: "index_fly_zone_flight_plans_on_flight_plan_id"
    t.index ["fly_zone_id"], name: "index_fly_zone_flight_plans_on_fly_zone_id"
  end

  create_table "fly_zones", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.text "regional_office_address"
    t.bigint "user_id"
    t.json "coordinates"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fly_zones_on_user_id"
  end

  create_table "gps_beamer_logs", charset: "utf8mb3", force: :cascade do |t|
    t.string "latitude"
    t.string "longitude"
    t.bigint "flight_id"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_gps_beamer_logs_on_flight_id"
  end

  create_table "languages", charset: "utf8mb3", force: :cascade do |t|
    t.string "language"
    t.string "country"
    t.string "region"
    t.string "continent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "location_type"
    t.string "status"
    t.text "address"
    t.json "coordinates"
    t.bigint "user_id"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "profiles", charset: "utf8mb3", force: :cascade do |t|
    t.string "user_id"
    t.string "per_hour_rate"
    t.string "per_hour_rate_currency"
    t.boolean "video"
    t.boolean "chat"
    t.boolean "call"
    t.text "description"
    t.string "phone_number"
    t.string "city"
    t.string "country"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles_languages", charset: "utf8mb3", force: :cascade do |t|
    t.string "profile_id"
    t.string "language_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_members", charset: "utf8mb3", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "status_id"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", charset: "utf8mb3", force: :cascade do |t|
    t.string "user_id"
    t.string "rate_unit"
    t.string "rate_per_unit"
    t.string "rate_currency"
    t.string "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rules", charset: "utf8mb3", force: :cascade do |t|
    t.integer "account_id"
    t.integer "user_id"
    t.json "filters"
    t.json "scores"
    t.json "order"
    t.string "type"
    t.string "name"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots", charset: "utf8mb3", force: :cascade do |t|
    t.time "time"
    t.date "date"
    t.integer "status"
    t.string "tutor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "start_location_flight_plans", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "start_location_id"
    t.bigint "flight_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_plan_id"], name: "index_start_location_flight_plans_on_flight_plan_id"
    t.index ["start_location_id"], name: "index_start_location_flight_plans_on_start_location_id"
  end

  create_table "start_locations", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.bigint "flight_plan_id"
    t.bigint "user_id"
    t.bigint "location_id"
    t.string "control_type"
    t.json "metadata"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_plan_id"], name: "index_start_locations_on_flight_plan_id"
    t.index ["location_id"], name: "index_start_locations_on_location_id"
    t.index ["user_id"], name: "index_start_locations_on_user_id"
  end

  create_table "statuses", charset: "utf8mb3", force: :cascade do |t|
    t.integer "account_id"
    t.string "label"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", charset: "utf8mb3", force: :cascade do |t|
    t.integer "assignee_id"
    t.string "title"
    t.text "description"
    t.json "metadata"
    t.date "completed_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "password_digest"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.string "provider"
    t.string "uid"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "control_centers", "locations"
  add_foreign_key "control_centers", "users"
  add_foreign_key "destination_flight_plans", "destinations"
  add_foreign_key "destination_flight_plans", "flight_plans"
  add_foreign_key "destinations", "users"
  add_foreign_key "flight_plans", "users"
  add_foreign_key "flights", "drones"
  add_foreign_key "flights", "flight_plans"
  add_foreign_key "flights", "fly_zones"
  add_foreign_key "flights", "users"
  add_foreign_key "fly_zones", "users"
  add_foreign_key "locations", "users"
  add_foreign_key "start_location_flight_plans", "flight_plans"
  add_foreign_key "start_location_flight_plans", "start_locations"
  add_foreign_key "start_locations", "users"
end
