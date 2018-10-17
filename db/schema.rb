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

ActiveRecord::Schema.define(version: 2018_10_17_223014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendees_on_event_id"
    t.index ["user_id"], name: "index_attendees_on_user_id"
  end

  create_table "bible_studies", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.integer "total_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bible_studies_on_user_id"
  end

  create_table "bible_study_meetings", force: :cascade do |t|
    t.bigint "bible_study_id"
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.time "from"
    t.time "to"
    t.string "repeat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bible_study_id"], name: "index_bible_study_meetings_on_bible_study_id"
  end

  create_table "bible_study_servants", force: :cascade do |t|
    t.bigint "bible_study_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bible_study_id"], name: "index_bible_study_servants_on_bible_study_id"
    t.index ["user_id"], name: "index_bible_study_servants_on_user_id"
  end

  create_table "course_servants", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_servants_on_course_id"
    t.index ["user_id"], name: "index_course_servants_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "no_of_lectures"
    t.integer "total_score"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.string "eventable_type"
    t.bigint "eventable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eventable_type", "eventable_id"], name: "index_events_on_eventable_type_and_eventable_id"
  end

  create_table "osra_meetings", force: :cascade do |t|
    t.bigint "osra_id"
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.time "from"
    t.time "to"
    t.string "repeat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["osra_id"], name: "index_osra_meetings_on_osra_id"
  end

  create_table "osra_servants", force: :cascade do |t|
    t.bigint "osra_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["osra_id"], name: "index_osra_servants_on_osra_id"
    t.index ["user_id"], name: "index_osra_servants_on_user_id"
  end

  create_table "osras", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mobile_number"
    t.date "birth_date"
    t.date "confession_date"
    t.date "holymass_date"
    t.date "tnawol_date"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
