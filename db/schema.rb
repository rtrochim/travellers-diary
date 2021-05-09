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

ActiveRecord::Schema.define(version: 2021_05_07_202644) do

  create_table "covid_reports", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "country_id"
    t.integer "cases"
    t.integer "deaths"
    t.integer "recovered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_covid_reports_on_country_id"
  end

  create_table "locations", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_locations_on_parent_id"
  end

  create_table "notes", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "city_id"
    t.bigint "weather_report_id"
    t.bigint "covid_report_id"
    t.text "content"
    t.date "travelled_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_notes_on_city_id"
    t.index ["covid_report_id"], name: "index_notes_on_covid_report_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
    t.index ["weather_report_id"], name: "index_notes_on_weather_report_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weather_reports", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "city_id"
    t.string "weather"
    t.integer "temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_weather_reports_on_city_id"
  end

  add_foreign_key "covid_reports", "locations", column: "country_id"
  add_foreign_key "locations", "locations", column: "parent_id"
  add_foreign_key "notes", "covid_reports"
  add_foreign_key "notes", "locations", column: "city_id"
  add_foreign_key "notes", "weather_reports"
  add_foreign_key "weather_reports", "locations", column: "city_id"
end
