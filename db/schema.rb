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

ActiveRecord::Schema.define(version: 2018_08_15_181048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "birth"
    t.string "email"
    t.string "instagram_link"
    t.string "facebook_link"
    t.string "vk_link"
    t.integer "status"
  end

  create_table "clients_metrics", id: false, force: :cascade do |t|
    t.bigint "metric_id", null: false
    t.bigint "client_id", null: false
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.datetime "datetime"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.bigint "snapshot_id"
    t.bigint "metric_id"
    t.decimal "value"
    t.index ["metric_id"], name: "index_measurements_on_metric_id"
    t.index ["snapshot_id"], name: "index_measurements_on_snapshot_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.string "name", null: false
    t.string "units", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind_id"
  end

  create_table "snapshots", force: :cascade do |t|
    t.date "date", null: false
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_snapshots_on_client_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.datetime "time"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "client_id"
    t.integer "status"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "user_id"
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
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
