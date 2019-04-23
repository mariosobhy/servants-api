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

ActiveRecord::Schema.define(version: 2019_04_06_003527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amin_osras", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "osra_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "church_admin_id"
    t.index ["church_admin_id"], name: "index_amin_osras_on_church_admin_id"
    t.index ["osra_id"], name: "index_amin_osras_on_osra_id"
    t.index ["user_id"], name: "index_amin_osras_on_user_id"
  end

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

  create_table "church_admins", force: :cascade do |t|
    t.bigint "church_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["church_id"], name: "index_church_admins_on_church_id"
    t.index ["user_id"], name: "index_church_admins_on_user_id"
  end

  create_table "churches", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "city"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classroom_servants", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_classroom_servants_on_classroom_id"
    t.index ["user_id"], name: "index_classroom_servants_on_user_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "osra_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["osra_id"], name: "index_classrooms_on_osra_id"
    t.index ["user_id"], name: "index_classrooms_on_user_id"
  end

  create_table "conference_servants", force: :cascade do |t|
    t.bigint "conference_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conference_id"], name: "index_conference_servants_on_conference_id"
    t.index ["user_id"], name: "index_conference_servants_on_user_id"
  end

  create_table "conferences", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "place"
    t.integer "no_of_servants"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "no_of_attendees", default: 0
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "osra_id"
    t.index ["osra_id"], name: "index_conferences_on_osra_id"
  end

  create_table "course_meetings", force: :cascade do |t|
    t.bigint "course_id"
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.time "from"
    t.time "to"
    t.string "repeat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_meetings_on_course_id"
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

  create_table "hobbies", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hobbies_on_user_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lectures_on_course_id"
  end

  create_table "material_links", force: :cascade do |t|
    t.string "label"
    t.string "url"
    t.bigint "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_material_links_on_lecture_id"
  end

  create_table "mobile_numbers", force: :cascade do |t|
    t.string "number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mobile_numbers_on_user_id"
  end

  create_table "osra_meeting_servants", force: :cascade do |t|
    t.bigint "osra_meeting_id"
    t.bigint "osra_servant_id"
    t.boolean "pray_before_sevice", default: false
    t.boolean "preparation", default: false
    t.boolean "speech", default: false
    t.string "visiting_abscene"
    t.string "phone_abscene"
    t.boolean "osra_meeting_preparation", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["osra_meeting_id"], name: "index_osra_meeting_servants_on_osra_meeting_id"
    t.index ["osra_servant_id"], name: "index_osra_meeting_servants_on_osra_servant_id"
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

  create_table "spiritual_day_servants", force: :cascade do |t|
    t.bigint "spiritual_day_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spiritual_day_id"], name: "index_spiritual_day_servants_on_spiritual_day_id"
    t.index ["user_id"], name: "index_spiritual_day_servants_on_user_id"
  end

  create_table "spiritual_days", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "place"
    t.integer "no_of_servants"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "osra_id"
    t.index ["osra_id"], name: "index_spiritual_days_on_osra_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.bigint "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_topics_on_lecture_id"
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
    t.date "birth_date"
    t.date "holymass_date"
    t.bigint "church_id"
    t.string "address"
    t.datetime "tnawol_date", default: [], array: true
    t.datetime "confession_date", default: [], array: true
    t.index ["church_id"], name: "index_users_on_church_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
