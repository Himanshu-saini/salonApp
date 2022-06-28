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

ActiveRecord::Schema.define(version: 2022_06_28_080059) do

  create_table "salons", charset: "utf8", force: :cascade do |t|
    t.string "company_name", null: false
    t.string "PAN_no"
    t.string "address"
    t.integer "total_chairs", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["PAN_no"], name: "index_salons_on_PAN_no", unique: true
  end

  create_table "service_bookings", charset: "utf8", force: :cascade do |t|
    t.string "customer_name"
    t.string "mobile"
    t.bigint "service_id"
    t.bigint "work_schedule_id"
    t.integer "status", limit: 1, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_service_bookings_on_service_id"
    t.index ["work_schedule_id"], name: "index_service_bookings_on_work_schedule_id"
  end

  create_table "services", charset: "utf8", force: :cascade do |t|
    t.bigint "salon_id"
    t.string "name", null: false
    t.float "price", default: 0.0
    t.integer "time_taken", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["salon_id"], name: "index_services_on_salon_id"
  end

  create_table "time_slots", charset: "utf8", force: :cascade do |t|
    t.string "slot", null: false
  end

  create_table "week_days", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "work_schedules", charset: "utf8", force: :cascade do |t|
    t.bigint "salon_id"
    t.bigint "week_day_id"
    t.bigint "time_slot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["salon_id"], name: "index_work_schedules_on_salon_id"
    t.index ["time_slot_id"], name: "index_work_schedules_on_time_slot_id"
    t.index ["week_day_id"], name: "index_work_schedules_on_week_day_id"
  end

  add_foreign_key "service_bookings", "services", on_update: :cascade, on_delete: :nullify
  add_foreign_key "service_bookings", "work_schedules", on_update: :cascade, on_delete: :nullify
  add_foreign_key "services", "salons", on_update: :cascade, on_delete: :nullify
  add_foreign_key "work_schedules", "salons", on_update: :cascade, on_delete: :nullify
  add_foreign_key "work_schedules", "time_slots", on_update: :cascade, on_delete: :nullify
  add_foreign_key "work_schedules", "week_days", on_update: :cascade, on_delete: :nullify
end
