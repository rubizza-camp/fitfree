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

ActiveRecord::Schema.define(version: 2018_08_28_055920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amounts", force: :cascade do |t|
    t.float "quantity"
    t.integer "client_id"
    t.integer "meter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.integer "message_id"
    t.text "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "second_name", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.integer "user_id"
    t.datetime "birth", default: "2018-08-26 17:10:26", null: false
    t.string "email", default: "", null: false
    t.string "instagram_link", default: "", null: false
    t.string "facebook_link", default: "", null: false
    t.string "vk_link", default: "", null: false
    t.integer "status", default: 0, null: false
    t.integer "price", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "telegram_chat_id"
    t.string "telegram_bind_id", default: "22353667-752a-4581-95a0-84ec0df77c98"
  end

  create_table "clients_metrics", id: false, force: :cascade do |t|
    t.bigint "metric_id", null: false
    t.bigint "client_id", null: false
  end

  create_table "clients_trainings", id: false, force: :cascade do |t|
    t.bigint "training_id"
    t.bigint "client_id"
    t.index ["client_id"], name: "index_clients_trainings_on_client_id"
    t.index ["training_id"], name: "index_clients_trainings_on_training_id"
  end

  create_table "coach_infos", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "birthdate"
    t.string "region", default: "", null: false
    t.string "town", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "facebook_sn", default: "", null: false
    t.string "instagram_sn", default: "", null: false
    t.string "vk_sn", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_coach_infos_on_user_id"
  end

  create_table "exercise_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.bigint "training_id"
    t.bigint "exercise_type_id"
    t.integer "repeats"
    t.integer "approaches"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_type_id"], name: "index_exercises_on_exercise_type_id"
    t.index ["training_id"], name: "index_exercises_on_training_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "message_id"
    t.integer "status"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "GUID"
    t.bigint "training_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_id"], name: "index_jobs_on_training_id"
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.datetime "datetime"
    t.text "description"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.bigint "snapshot_id"
    t.bigint "metric_id"
    t.decimal "value"
    t.index ["metric_id"], name: "index_measurements_on_metric_id"
    t.index ["snapshot_id"], name: "index_measurements_on_snapshot_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text", default: "", null: false
    t.string "update_id", default: "", null: false
    t.integer "status", default: 0
    t.string "messagable_type"
    t.bigint "messagable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["messagable_type", "messagable_id"], name: "index_messages_on_messagable_type_and_messagable_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.string "name", null: false
    t.string "units", null: false
    t.integer "kind_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snapshots", force: :cascade do |t|
    t.date "date", null: false
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_snapshots_on_client_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telegram_bots", force: :cascade do |t|
    t.bigint "user_id"
    t.string "token", default: "", null: false
    t.string "telegram_webhook_id", default: "002fbb55-8d49-4661-ad18-4d6959104a2c", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_telegram_bots_on_user_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "time"
    t.integer "price"
    t.text "description"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trainings_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "datetime"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "price"
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
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "jobs", "trainings"
end
