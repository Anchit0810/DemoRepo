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

ActiveRecord::Schema[8.1].define(version: 2026_04_14_101140) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "cities", force: :cascade do |t|
    t.string "city_name"
    t.datetime "created_at", null: false
    t.string "state"
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "duration"
    t.decimal "imdb_rating", precision: 2, scale: 1, null: false
    t.string "language", null: false
    t.string "movie_category", null: false
    t.string "movie_genre", null: false
    t.string "movie_name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", force: :cascade do |t|
    t.boolean "booked", default: false
    t.datetime "created_at", null: false
    t.string "seat_number"
    t.bigint "show_id", null: false
    t.datetime "updated_at", null: false
    t.index ["seat_number"], name: "index_seats_on_seat_number", unique: true
    t.index ["show_id"], name: "index_seats_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "movie_id", null: false
    t.datetime "show_time"
    t.uuid "theater_id", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_shows_on_movie_id"
    t.index ["theater_id"], name: "index_shows_on_theater_id"
  end

  create_table "theaters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.string "theater_location"
    t.string "theater_name"
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_theaters_on_city_id"
    t.index ["theater_name", "theater_location"], name: "index_theaters_on_theater_name_and_theater_location"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.integer "role"
    t.datetime "updated_at", null: false
    t.string "user_email"
    t.string "user_name"
    t.string "user_number"
    t.index ["user_email"], name: "index_users_on_user_email", unique: true
    t.index ["user_number"], name: "index_users_on_user_number", unique: true
  end

  add_foreign_key "seats", "shows"
  add_foreign_key "shows", "movies"
  add_foreign_key "shows", "theaters"
  add_foreign_key "theaters", "cities"
end
