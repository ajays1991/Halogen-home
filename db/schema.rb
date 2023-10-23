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

ActiveRecord::Schema.define(version: 20190923074414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.integer "students_count", default: 0, null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_accounts_on_name", unique: true
  end

  create_table "assignment_types", force: :cascade do |t|
    t.string "name"
    t.string "account_id"
    t.integer "user_id"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.integer "account_id"
    t.integer "assignment_type_id"
    t.integer "file_id"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "camera_logs", force: :cascade do |t|
    t.string "name"
    t.bigint "flight_id"
    t.bigint "user_id"
    t.jsonb "camera_specifications"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_camera_logs_on_flight_id"
    t.index ["user_id"], name: "index_camera_logs_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "control_centers", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_control_centers_on_location_id"
    t.index ["user_id"], name: "index_control_centers_on_user_id"
  end

  create_table "database_connections", force: :cascade do |t|
    t.string "name"
    t.string "provide"
    t.string "username"
    t.string "password"
    t.string "access_token"
    t.jsonb "metadata"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destination_flight_plans", force: :cascade do |t|
    t.bigint "destination_id"
    t.bigint "flight_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_destination_flight_plans_on_destination_id"
    t.index ["flight_plan_id"], name: "index_destination_flight_plans_on_flight_plan_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.bigint "flight_plan_id"
    t.bigint "user_id"
    t.bigint "location_id"
    t.string "control_type"
    t.jsonb "metadata"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_plan_id"], name: "index_destinations_on_flight_plan_id"
    t.index ["location_id"], name: "index_destinations_on_location_id"
    t.index ["user_id"], name: "index_destinations_on_user_id"
  end

  create_table "drone_flights", force: :cascade do |t|
    t.bigint "drone_id"
    t.bigint "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drone_id"], name: "index_drone_flights_on_drone_id"
    t.index ["flight_id"], name: "index_drone_flights_on_flight_id"
  end

  create_table "drones", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.string "mac_address"
    t.string "ipv4"
    t.string "flight_type"
    t.integer "flights_count"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "account"
    t.string "event"
    t.string "event_type"
    t.jsonb "meta"
    t.jsonb "address"
    t.jsonb "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flight_plans", force: :cascade do |t|
    t.string "name"
    t.string "control_type", default: "Auto"
    t.string "status", default: "Ready"
    t.bigint "user_id"
    t.integer "flight_plan_type"
    t.bigint "start_location_id"
    t.bigint "destination_id"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "control_center_id"
    t.index ["destination_id"], name: "index_flight_plans_on_destination_id"
    t.index ["start_location_id"], name: "index_flight_plans_on_start_location_id"
    t.index ["user_id"], name: "index_flight_plans_on_user_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "name"
    t.string "flight_code"
    t.string "flight_type"
    t.string "status"
    t.bigint "user_id"
    t.bigint "drone_id"
    t.bigint "flight_plan_id"
    t.bigint "fly_zone_id"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drone_id"], name: "index_flights_on_drone_id"
    t.index ["flight_plan_id"], name: "index_flights_on_flight_plan_id"
    t.index ["fly_zone_id"], name: "index_flights_on_fly_zone_id"
    t.index ["user_id"], name: "index_flights_on_user_id"
  end

  create_table "fly_zone_flight_plans", force: :cascade do |t|
    t.bigint "fly_zone_id"
    t.bigint "flight_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_plan_id"], name: "index_fly_zone_flight_plans_on_flight_plan_id"
    t.index ["fly_zone_id"], name: "index_fly_zone_flight_plans_on_fly_zone_id"
  end

  create_table "fly_zones", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.text "regional_office_address"
    t.bigint "user_id"
    t.jsonb "coordinates"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fly_zones_on_user_id"
  end

  create_table "gps_beamer_logs", force: :cascade do |t|
    t.string "latitude"
    t.string "longitude"
    t.bigint "flight_id"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_gps_beamer_logs_on_flight_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "location_type"
    t.string "status"
    t.text "address"
    t.jsonb "coordinates"
    t.bigint "user_id"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "project_members", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "status_id"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.integer "account_id"
    t.integer "user_id"
    t.jsonb "filters"
    t.jsonb "scores"
    t.jsonb "order"
    t.string "type"
    t.string "name"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "start_location_flight_plans", force: :cascade do |t|
    t.bigint "start_location_id"
    t.bigint "flight_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_plan_id"], name: "index_start_location_flight_plans_on_flight_plan_id"
    t.index ["start_location_id"], name: "index_start_location_flight_plans_on_start_location_id"
  end

  create_table "start_locations", force: :cascade do |t|
    t.string "name"
    t.bigint "flight_plan_id"
    t.bigint "user_id"
    t.bigint "location_id"
    t.string "control_type"
    t.jsonb "metadata"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_plan_id"], name: "index_start_locations_on_flight_plan_id"
    t.index ["location_id"], name: "index_start_locations_on_location_id"
    t.index ["user_id"], name: "index_start_locations_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "account_id"
    t.string "label"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "assignee_id"
    t.string "title"
    t.text "description"
    t.jsonb "metadata"
    t.date "completed_on"
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
    t.string "authentication_token", limit: 30
    t.string "provider"
    t.string "uid"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

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
