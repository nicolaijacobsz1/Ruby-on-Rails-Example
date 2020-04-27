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

ActiveRecord::Schema.define(version: 2020_04_03_034045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "calls", force: :cascade do |t|
    t.bigint "caller_id"
    t.bigint "call_receiver_id"
    t.string "call_type"
    t.string "start_time"
    t.string "end_time"
    t.boolean "flag_answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_receiver_id"], name: "index_calls_on_call_receiver_id"
    t.index ["caller_id"], name: "index_calls_on_caller_id"
  end

  create_table "channels", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "member_ids", default: [], array: true
    t.boolean "flag_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_channels_on_creator_id"
  end

  create_table "configurations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "param"
    t.string "type"
    t.string "value"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "contact_id"
    t.boolean "flag_favourite", default: false
    t.string "phone_number"
    t.boolean "flag_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_contacts_on_contact_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.bigint "time_zone_id"
    t.string "name"
    t.boolean "flag_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_zone_id"], name: "index_countries_on_time_zone_id"
  end

  create_table "do_not_disturbs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "time_zone_id"
    t.string "from_time"
    t.string "to_time"
    t.string "days", default: [], array: true
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_zone_id"], name: "index_do_not_disturbs_on_time_zone_id"
    t.index ["user_id"], name: "index_do_not_disturbs_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "language_name"
    t.string "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.bigint "channel_id"
    t.string "attachment"
    t.string "read_at"
    t.string "message_type"
    t.string "body"
    t.boolean "flag_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_messages_on_channel_id"
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "notifiable_id"
    t.string "notifiable_type"
    t.string "title"
    t.string "body"
    t.boolean "flag_read", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "time_zone_id"
    t.bigint "language_id"
    t.string "profile_image_id"
    t.string "latitude"
    t.string "longitude"
    t.string "location"
    t.string "last_seen_at"
    t.boolean "do_not_disturb", default: false
    t.boolean "location_enabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_profiles_on_language_id"
    t.index ["time_zone_id"], name: "index_profiles_on_time_zone_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "scheduler_id"
    t.string "scheduler_with_ids", default: [], array: true
    t.string "schedulable_type"
    t.string "date"
    t.string "time"
    t.string "description"
    t.string "status"
    t.boolean "flag_repeat", null: false
    t.boolean "flag_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scheduler_id"], name: "index_schedules_on_scheduler_id"
  end

  create_table "time_zones", force: :cascade do |t|
    t.string "time_offset"
    t.string "location"
    t.boolean "flag_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "times", force: :cascade do |t|
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.string "encrypted_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "verified", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "calls", "users", column: "call_receiver_id"
  add_foreign_key "calls", "users", column: "caller_id"
  add_foreign_key "channels", "users", column: "creator_id"
  add_foreign_key "contacts", "users", column: "contact_id"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
end
